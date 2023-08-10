import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/Data/database.dart';
import 'package:todo_list/Util/dialog_box.dart';
import 'package:todo_list/Util/todo_tile.dart';

class Personal_Page extends StatefulWidget {
  const Personal_Page({super.key});

  @override
  State<Personal_Page> createState() => _Personal_PageState();
}

class _Personal_PageState extends State<Personal_Page> {
  //reference the hive box
  final _mybox = Hive.box('mybox1');
  ToDoDataBase db = ToDoDataBase(box: 'mybox1');

  @override
  void initState() {
    //fist time opening app create default data
    if (_mybox.get('TODOLIST') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  //text controller
  final _controler = TextEditingController();

  //check box tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      if(db.toDoList[index][1] == false){
        db.taskCount -= 1;
      } else {
        db.taskCount += 1;
      }
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDB();
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controler.text, false, 1]);
      db.taskCount += 1;
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
      if(db.toDoList[index][1] == false){
        db.taskCount -= 1;
      }
      db.toDoList.removeAt(index);
    });
    db.updateDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Personal'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            db.loadData();
            Navigator.pop(context);
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(25, 25, 0, 0),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Hero(
                      tag: 'IconPersonal',
                      child: Icon(
                        Icons.person,
                        color: Colors.red[300],
                      ),
                    )
                ),
                SizedBox(height: 40.0,),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '${db.taskCount} Tasks',  //TODO depois o tipo de tasks
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey.withOpacity(0.6),

                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Personal',
                          style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.grey[850]
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
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
          ),
        ],
      ),
    );
  }
}
