import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {

  String username = 'Tiago';
  int tasks = 10;



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

      floatingActionButton: Center(
        child: Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add),
            )
        ),
      ),

      backgroundColor: Colors.cyanAccent,
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
                        SizedBox(height: 30,),
                        Container(
                          child: CarouselSlider(
                            options: CarouselOptions(
                              height: 250,
                              aspectRatio: 1.0,
                              enlargeCenterPage: true,
                            ),
                            items: [1,2,3].map((i) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                      width: MediaQuery.of(context).size.width,
                                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                                      padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                      decoration: BoxDecoration(
                                          color: Colors.amber,
                                        borderRadius: BorderRadius.all(Radius.circular(20))
                                      ),
                                      child: Text('text $i', style: TextStyle(fontSize: 16.0),)
                                  );
                                },
                              );
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
