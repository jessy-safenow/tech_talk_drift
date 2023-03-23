import 'package:drift/drift.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'my_database.dart';

final catDaoProvider = Provider<CatDao>(
  (ref) => CatDao(db: ref.read(myDatabaseProvider)),
);

class CatDao {
  CatDao({required this.db});

  final MyDatabase db;

  Future<List<CatData>> getCatList() async {
    return await db.cat.select().get();
  }

  Future<int> insertCat(Insertable<CatData> cat) async {
    return await db.cat.insertOnConflictUpdate(cat);
  }

  Future<int> removeCats() async {
    return await db.cat.deleteAll();
  }

  Future<int> removeCatById(int id) async {
    return await db.cat.deleteWhere((tbl) => tbl.id.equals(id));
  }
}
