import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo_list/Data/database.dart';
import 'package:todo_list/Lists_pages/homeList_page.dart';
import 'package:todo_list/Lists_pages/personal_page.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {

  String username = 'User';
  int tasks = 0;
  Color? backgroundColor = Colors.white;
  int _colorNumber = 0;

  //Personal
  final _mybox1 = Hive.box('mybox1');
  ToDoDataBase db1 = ToDoDataBase(box: 'mybox1');

  //Home
  final _mybox2 = Hive.box('mybox2');
  ToDoDataBase db2 = ToDoDataBase(box: 'mybox2');

  //Work
  final _mybox3 = Hive.box('mybox3');
  ToDoDataBase db3 = ToDoDataBase(box: 'mybox3');

  @override
  void initState() {
    //fist time opening app create default task count
    if (_mybox1.get('TODOLIST') == null) {
      db1.initCount();
    } else {
      db1.loadData();
    }

    if (_mybox2.get('TODOLIST') == null) {
      db2.initCount();
    } else {
      db2.loadData();
    }

    if (_mybox3.get('TODOLIST') == null) {
      db3.initCount();
    } else {
      db3.loadData();
    }

    tasks = db1.taskCount + db2.taskCount + db3.taskCount;
    super.initState();
  }



  Color? changebgColor() {
    if (_colorNumber == 0){
      return backgroundColor = Colors.red[300];
    } else if(_colorNumber == 1){
      return backgroundColor = Colors.blue[400];
    } else{
      return backgroundColor = Colors.green[300];
    }
  }


  Widget buildTaskCategory(int i) {
    if (i == 1) {
      return GestureDetector(
        onTap: () {Navigator.pushNamed(context, '/personal_pages').whenComplete(() => setState(() {db1.loadData();}));},
        child: Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Hero(
                      tag: 'IconPersonal',
                      child: Icon(
                          Icons.person,
                        color: backgroundColor = Colors.red[300],
                      ),
                    )
                ),
                SizedBox(height: 100.0,),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '${db1.taskCount} Tasks',
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
                )
              ],
            )
        ),
      );

    } else if (i == 2){
      return GestureDetector(
        onTap: () {Navigator.pushNamed(context, '/work_page').whenComplete(() => setState(() {db3.loadData();}));},
        child: Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Hero(
                      tag: 'IconWork',
                      child: Icon(
                        Icons.work,
                        color: backgroundColor = Colors.blue[400],
                      ),
                    )
                ),
                SizedBox(height: 100.0,),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '${db3.taskCount} Tasks',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey.withOpacity(0.6),

                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Work',
                          style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.grey[850]
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
        ),
      );
    } else {
      return GestureDetector(
        onTap: () {Navigator.pushNamed(context, '/homeList_Page').whenComplete(() => setState(() {db2.loadData();}));},
        child: Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Hero(
                      tag: 'iconHome',
                      child: Icon(
                        Icons.home,
                        color: backgroundColor = Colors.green[300],
                      ),
                    )
                ),
                SizedBox(height: 100.0,),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '${db2.taskCount} Tasks',
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
                )
              ],
            )
        ),
      );
    }
  }



  @override
  build(BuildContext context) {
    print('load');
    db1.loadData();
    db3.loadData();
    db2.loadData();
    tasks = db1.taskCount + db2.taskCount + db3.taskCount;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'ToDo',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        //the right one
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 40.0,
              ),
          )
        ],
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/img_nav1.jpg'), fit: BoxFit.fill)
              ),
              child: Text(''),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('My Account', style: TextStyle(color: Colors.grey[700])),
              onTap: () {
                Navigator.pushNamed(context, '/my_account');
              },
            ),
            ListTile(
              leading: Icon(Icons.done_all),
              title: Text('Done List', style: TextStyle(color: Colors.grey[700])),
              onTap: () {
                Navigator.pushNamed(context, '/done_list');
              },
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: Text('Change Language', style: TextStyle(color: Colors.grey[700])),
              onTap: () {
                Navigator.pushNamed(context, '/change_language');
              },
            ),
            ListTile(
              leading: Icon(Icons.palette),
              title: Text('Change Theme', style: TextStyle(color: Colors.grey[700])),
              onTap: () {
                Navigator.pushNamed(context, '/change_theme');
              },
            ),
            // ListTile(
            //   leading: Icon(Icons.feed),
            //   title: Text('Feedback Wall', style: TextStyle(color: Colors.grey[700])),
            //   onTap: () {
            //     Navigator.pushNamed(context, '/feedback_wall');
            //   },
            // ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings', style: TextStyle(color: Colors.grey[700])),
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ],
        ),
      ),

      //button to add tasks faster
      floatingActionButton: Center(
        child: Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: FloatingActionButton(
              backgroundColor: changebgColor(),
              onPressed: () {},
              child: Icon(Icons.add),
            )
        ),
      ),

      backgroundColor: changebgColor(),
      body: Column(
        children: [
          Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Opacity(
                      opacity: 1.0, //muda com o menu
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(52, 8, 50, 0),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: InkWell(
                                    onTap: () {Navigator.pushNamed(context, '/my_account');}, //go to profile
                                    child: Hero(
                                      tag: 'avatar',
                                      child: Container(
                                        width: 60,
                                        height: 60,
                                        child: CircleAvatar(
                                          radius: 30.0,
                                          backgroundColor: backgroundColor,
                                          backgroundImage: AssetImage('assets/img.jpg'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 100,),
                              Expanded(
                                flex: 1,
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    child: Container(),
                                  )
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(60, 0, 50, 0),
                          child: Container(
                            margin: EdgeInsets.only(top: 20.0, left: 12),
                            child: SingleChildScrollView(
                              child: Row(
                                children: [
                                  Flexible(
                                      child: InkWell(
                                        onTap: () {}, //profile page
                                        child: Text(
                                          'Hello, $username',
                                          style: TextStyle(
                                            fontSize: 30.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      )
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(60, 0, 50, 0),
                          child: Container(
                            margin: EdgeInsets.only(top: 20.0, left: 12),
                            child: SingleChildScrollView(
                              child: Row(
                                children: [
                                  Flexible(
                                      child: InkWell(
                                        onTap: () {}, //profile page
                                        child: Text(
                                          'This is your to-do list\nToday you have $tasks tasks to complete.',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            height: 1.3,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                            overflow: TextOverflow.clip,
                                          ),
                                        ),
                                      )
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 40,),
                        Container(
                          child: CarouselSlider(
                            options: CarouselOptions(
                              height: 250,
                              aspectRatio: 1.0,
                              enlargeCenterPage: true,
                              onPageChanged: (ColorNumber, reason) {
                                setState(() {
                                  _colorNumber = ColorNumber;
                                });
                              },
                            ),
                            items: [1,2,3].map((i) {
                              return buildTaskCategory(i);
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      )



    );
  }
}
