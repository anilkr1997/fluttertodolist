

import 'package:realm/realm.dart';

import '_Taskdb.dart';

class RealmSinglationclass{

  static final RealmSinglationclass singlationclass=RealmSinglationclass._internal();
  factory RealmSinglationclass(){
    return singlationclass;
  }
  RealmSinglationclass._internal(){
    var config = Configuration.local([Taskdb.schema]);
   Realm realm = Realm(config);

  }
}