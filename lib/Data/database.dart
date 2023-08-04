import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase{

  List toDoList = [];

  //reference box
  final _mybox = Hive.box('mybox');

  //run this if its the first time running this app
  void createInitialData() {
    toDoList = [
      ['Welcome', false],
      ['To delete, slide this task', false],
    ];
  }

  //load data from db
  void loadData() {
    toDoList = _mybox.get('TODOLIST');
  }

  //update db
  void updateDB() {
    _mybox.put('TODOLIST', toDoList);
  }
}