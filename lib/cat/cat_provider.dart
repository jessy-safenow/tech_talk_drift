import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../database/cat_dao.dart';
import '../database/my_database.dart';

final catProvider =
    StateNotifierProvider<CatNotifier, AsyncValue<List<CatData>>>(
  (ref) => CatNotifier(
    catDao: ref.read(catDaoProvider),
  ),
);

class CatNotifier extends StateNotifier<AsyncValue<List<CatData>>> {
  CatNotifier({required this.catDao}) : super(const AsyncData([]));

  final CatDao catDao;
  static const _notifierName = 'CatNotifier';

  Future<void> loadCats() async {
    state = const AsyncLoading();
    try {
      final cats = await catDao.getCatList();
      state = AsyncData(cats);
    } catch (e, stackTrace) {
      log('Could not load the cats: $e', name: _notifierName);
      state = AsyncError(e, stackTrace);
    }
  }

  Future<void> addCat({required String name, int? age}) async {
    try {
      await catDao.insertCat(CatCompanion.insert(name: name, age: Value(age)));
      await loadCats();
    } catch (e) {
      log('Could not add the cat: $e', name: _notifierName);
    }
  }

  Future<void> removeCats() async {
    try {
      await catDao.removeCats();
      await loadCats();
    } catch (e) {
      log('Could not remove the cats: $e', name: _notifierName);
    }
  }

  Future<void> removeCat(int id) async {
    try {
      await catDao.removeCatById(id);
      await loadCats();
    } catch (e) {
      log('Could not remove the cat: $e', name: _notifierName);
    }
  }
}
