import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase{
  final String box;
  ToDoDataBase({
    required this.box
  });

  List toDoList = [];
  int lengthCount = 2;


  //run this if its the first time running this app
  void createInitialData() {
    toDoList = [
      ['Welcome', false, 1],
      ['To delete, slide this task', false, 1],
    ];
  }

  //load data from db
  void loadData() {
    toDoList = Hive.box(box).get('TODOLIST');
  }

  //update db
  void updateDB() {
    Hive.box(box).put('TODOLIST', toDoList);
  }
}