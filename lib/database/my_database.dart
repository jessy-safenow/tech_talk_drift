import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

part 'my_database.g.dart';

final myDatabaseProvider = Provider<MyDatabase>((_) => MyDatabase());

class Cat extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  IntColumn get age => integer().nullable()();
}

@DriftDatabase(tables: [Cat])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition.
  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'my_database.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
