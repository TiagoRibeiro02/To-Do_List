import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/Data/database.dart';
import 'package:todo_list/Util/dialog_box.dart';
import 'package:todo_list/Util/todo_tile.dart';

class Work_Page extends StatefulWidget {
  const Work_Page({super.key});

  @override
  State<Work_Page> createState() => _Work_PageState();
}

class _Work_PageState extends State<Work_Page> {
  //reference the hive box
  final _mybox = Hive.box('mybox3');
  ToDoDataBase db = ToDoDataBase(box: 'mybox3');

  @override
  void initState() {
    // fist timne opening app create default data
    if(_mybox.get('TODOLIST') == null) {
      db.createInitialData();
    }else{
      db.loadData();
    }

    super.initState();
  }


  //text controller
  final _controler = TextEditingController();

  //check box tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDB();
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controler.text, false, 3]);
      _controler.clear();
    });
    Navigator.of(context).pop();
    db.updateDB();
  }



  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controler,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Work'),
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              db.updateDB();
              Navigator.of(context).pop();
            }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
            return ToDoTile(
              taskName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onChange: (value) => checkBoxChanged(value, index),
              deleteFunction: (context) => deleteTask(index),
            );

        },

      ),
    );
  }
}
