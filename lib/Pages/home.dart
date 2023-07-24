import 'package:flutter/material.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {

  String username = 'Tiago';
  int tasks = 0;



  @override
  Widget build(BuildContext context) {
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
        //left
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              size: 40.0,
            ),
        ),
      ),



      backgroundColor: Colors.cyanAccent,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Opacity(
                  opacity: 1.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(62, 8, 50, 0),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 1,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: InkWell(
                                onTap: () {}, //go to profile
                                child: Hero(
                                  tag: 'avatar',
                                  child: Container(
                                    width: 60,
                                    height: 60,
                                    child: CircleAvatar(
                                      radius: 30.0,
                                      backgroundColor: Colors.green,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
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
                      margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
                      child: Container(
                        margin: EdgeInsets.only(top: 20.0, left: 12),
                        child: SingleChildScrollView(
                          child: Row(
                            children: [
                              Flexible(
                                  child: InkWell(
                                    onTap: () {}, //profile page
                                    child: Text(
                                      'Hello $username',
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
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      )

    );
  }
}
