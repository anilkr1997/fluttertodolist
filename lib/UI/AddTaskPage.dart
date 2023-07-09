import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertodolist/main.dart';
import 'package:realm/realm.dart';

import '../Database/_Taskdb.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
 late Realm realm;
  TextEditingController tasktitle=TextEditingController();
  TextEditingController taskdesc=TextEditingController();
  TextEditingController taskprority=TextEditingController();
  @override
  void initState() {
    var config = Configuration.local([Taskdb.schema]);
    realm = Realm(config);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

        drawerEnableOpenDragGesture: true,

        appBar:AppBar(title: const Text("Add Task",),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,

leading: IconButton(onPressed:(){
  //Navigator.push( context, MaterialPageRoute( builder: (context) => MyHomePage(title: "title")), ).then((value) => setState(() {}));
Navigator.pop(context);


}, icon: const Icon(Icons.arrow_back),mouseCursor: MouseCursor.defer,),



        ),

        body:

        Container(

          child:  Center(

        child: Column(
          children: [
            Container(
              height: 45,
              margin: const EdgeInsets.all(10.0),
              child:  TextField(
                controller: tasktitle,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    labelText: 'Task Title'),
              ),
            ),  Container(
              height: 45,
              margin: const EdgeInsets.all(10.0),
              child: TextField(

                controller: taskdesc,
                keyboardType: TextInputType.multiline,
                decoration:  const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    hintText: 'This is your Task ',

                    ),

              ),
            ),  Container(
              height: 45,

              margin: const EdgeInsets.all(10.0),
              child:  TextField(

                keyboardType: TextInputType.number,
                controller: taskprority,
                decoration:  const InputDecoration(
                    border: OutlineInputBorder(

                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    labelText: 'Task Priority'),
              ),
            ),
            Center(
              child: Container(
                height: 50,
                width: 200,
                margin: EdgeInsets.all(20),
                alignment: Alignment.center,

                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(10),

                  color: Colors.blue,
                ),
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        if(validation()){
realm.write(() => realm.add(Taskdb( 0,tasktitle.text.toString(), taskdesc.text.toString(), taskprority.text.toString())));

                       }
                      });
                    },
                    style: ButtonStyle(),
                    child: const Text(
                      "Add Task",
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    )),
              ),
            ),
          ],
        ),
      )),
    );
  }

  bool validation() {
if(tasktitle.text.isEmpty){
showToast(context, "Please Enter Task name");
  return false;
}else if(taskdesc.text.isEmpty){
showToast(context, "Please Enter Task Description");
  return false;
}else if(taskprority.text.isEmpty){
showToast(context, "Please Enter Task Priority");
  return false;
}
    return true;
  }
  void goback(){

  }
 static void showToast(BuildContext context, String? a) {
   final scaffold = ScaffoldMessenger.of(context);
   scaffold.showSnackBar(
     SnackBar(content: Text(a!)),
   );
 }
 @override
  void didUpdateWidget(covariant AddTaskPage oldWidget) {
   print("object1");
   oldWidget.createState().dispose();
    super.didUpdateWidget(oldWidget);
  }
 @override
  void dispose() {
    print("object");

    super.dispose();
  }
  @override
  void didChangeDependencies() {
    print("object2");

    super.didChangeDependencies();
  }
  @override
  void deactivate() {
    print("object3");
   // Navigator.of(context,rootNavigator: true).pop(context);
    super.deactivate();
  }
}
