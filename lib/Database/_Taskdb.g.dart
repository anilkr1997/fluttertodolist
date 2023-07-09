// GENERATED CODE - DO NOT MODIFY BY HAND

part of '_Taskdb.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Taskdb extends _Taskdb with RealmEntity, RealmObjectBase, RealmObject {
  Taskdb(
    int id,
    String Taskname,
    String TaskDetail,
    String Taskpriority,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'Taskname', Taskname);
    RealmObjectBase.set(this, 'TaskDetail', TaskDetail);
    RealmObjectBase.set(this, 'Taskpriority', Taskpriority);
  }

  Taskdb._();

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get Taskname =>
      RealmObjectBase.get<String>(this, 'Taskname') as String;
  @override
  set Taskname(String value) => RealmObjectBase.set(this, 'Taskname', value);

  @override
  String get TaskDetail =>
      RealmObjectBase.get<String>(this, 'TaskDetail') as String;
  @override
  set TaskDetail(String value) =>
      RealmObjectBase.set(this, 'TaskDetail', value);

  @override
  String get Taskpriority =>
      RealmObjectBase.get<String>(this, 'Taskpriority') as String;
  @override
  set Taskpriority(String value) =>
      RealmObjectBase.set(this, 'Taskpriority', value);

  @override
  Stream<RealmObjectChanges<Taskdb>> get changes =>
      RealmObjectBase.getChanges<Taskdb>(this);

  @override
  Taskdb freeze() => RealmObjectBase.freezeObject<Taskdb>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Taskdb._);
    return const SchemaObject(ObjectType.realmObject, Taskdb, 'Taskdb', [
      SchemaProperty('id', RealmPropertyType.int),
      SchemaProperty('Taskname', RealmPropertyType.string),
      SchemaProperty('TaskDetail', RealmPropertyType.string),
      SchemaProperty('Taskpriority', RealmPropertyType.string),
    ]);
  }
}
