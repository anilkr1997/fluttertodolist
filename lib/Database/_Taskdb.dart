import 'package:realm/realm.dart';
part '_Taskdb.g.dart';
@RealmModel(ObjectType.realmObject)
class _Taskdb{
  @PrimaryKey()
  late int id;
late String Taskname;
late String TaskDetail;
late String Taskpriority;
}