// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_database.dart';

// ignore_for_file: type=lint
class $CatTable extends Cat with TableInfo<$CatTable, CatData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CatTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
      'age', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, name, age];
  @override
  String get aliasedName => _alias ?? 'cat';
  @override
  String get actualTableName => 'cat';
  @override
  VerificationContext validateIntegrity(Insertable<CatData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('age')) {
      context.handle(
          _ageMeta, age.isAcceptableOrUnknown(data['age']!, _ageMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CatData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CatData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      age: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}age']),
    );
  }

  @override
  $CatTable createAlias(String alias) {
    return $CatTable(attachedDatabase, alias);
  }
}

class CatData extends DataClass implements Insertable<CatData> {
  final int id;
  final String name;
  final int? age;
  const CatData({required this.id, required this.name, this.age});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || age != null) {
      map['age'] = Variable<int>(age);
    }
    return map;
  }

  CatCompanion toCompanion(bool nullToAbsent) {
    return CatCompanion(
      id: Value(id),
      name: Value(name),
      age: age == null && nullToAbsent ? const Value.absent() : Value(age),
    );
  }

  factory CatData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CatData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      age: serializer.fromJson<int?>(json['age']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'age': serializer.toJson<int?>(age),
    };
  }

  CatData copyWith(
          {int? id, String? name, Value<int?> age = const Value.absent()}) =>
      CatData(
        id: id ?? this.id,
        name: name ?? this.name,
        age: age.present ? age.value : this.age,
      );
  @override
  String toString() {
    return (StringBuffer('CatData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('age: $age')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, age);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CatData &&
          other.id == this.id &&
          other.name == this.name &&
          other.age == this.age);
}

class CatCompanion extends UpdateCompanion<CatData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int?> age;
  const CatCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.age = const Value.absent(),
  });
  CatCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.age = const Value.absent(),
  }) : name = Value(name);
  static Insertable<CatData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? age,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (age != null) 'age': age,
    });
  }

  CatCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<int?>? age}) {
    return CatCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CatCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('age: $age')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $CatTable cat = $CatTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [cat];
}
