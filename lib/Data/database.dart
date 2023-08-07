import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase{

  List toDoList = [];
  int lengthCount = 2;

  //reference box
  final _mybox = Hive.box('mybox');

  //run this if its the first time running this app
  void createInitialData() {
    toDoList = [
      ['Welcome', false, 1],
      ['To delete, slide this task', false, 1],
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

  void getLength() {
      for (int i=0; i<toDoList.length; i++){
        if(toDoList[2]==1){
          lengthCount += 1;
          print('entrei aqui');
        }else{
          lengthCount +=0;
        }
      }
  }
}