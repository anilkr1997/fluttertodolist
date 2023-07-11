import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertodolist/Database/_Taskdb.dart';
import 'package:fluttertodolist/UI/AddTaskPage.dart';
import 'package:fluttertodolist/Database/Uttil.dart';

import 'package:realm/realm.dart';

import 'Database/_Taskdb.dart';

void main() {
  // Create a Configuration object

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Todo List App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Taskdb> array = [];
  late Realm realm;
  late var config;

// Opean a Realm

  void _incrementCounter() {
    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const AddTaskPage();
      }));
    });
  }

  @override
  void initState() {
    config = Configuration.local([Taskdb.schema]);
    realm = Realm(config);
    loadlistofitem();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title, textAlign: TextAlign.left),
        actions: [
          IconButton(
              onPressed: () {
                loadlistofitem();
              },
              splashRadius: 20.0,
              icon: Icon(Icons.refresh)),
          // IconButton(
          //     onPressed: () {
          //       realm.writeCopy(config);
          //       realm.write(() => realm.all());
          //
          //       realm.refreshAsync();
          //
          //       setState(() {});
          //     },
          //     splashRadius: 20.0,
          //     icon: Icon(Icons.delete)),
        ],
      ),
      body: Center(
          child: array.length > 0
              ? ListView.builder(
                  itemCount: array.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: SizedBox(
                          width: 50,
                          height: 50,
                          child: Icon(Icons.list),
                        ),
                        title: Text(array[index].Taskname),
                        subtitle: Text(array[index].TaskDetail),
                        onLongPress: () {


                          setState(() {});
                        },
                        onTap: () {
                          Uttil.showmassage(
                              context, "Long Press for Delete Item");
                        },
                      ),
                    );
                  },
                )
              : Text("Data Not Found }")),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void dispose() {
    print("5");

    super.dispose();
  }

  @override
  void didChangeDependencies() {
    print("4");

    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    print("3");

    super.deactivate();
  }

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    print("2");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    print("1");
    super.debugFillProperties(properties);
  }

  @override
  void setState(VoidCallback fn) {
    print("6");

    super.setState(fn);
  }

  void loadlistofitem() {
    if (realm.all<Taskdb>().isEmpty) {
      print("size............${array.length}");
    } else {
      setState(() {
        array.clear();
        array.addAll(realm.all<Taskdb>());
      });
    }
  }
}
