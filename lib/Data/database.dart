import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase{

  List toDoList = [];

  //reference box
  final _mybox = Hive.openBox('mybox');
}