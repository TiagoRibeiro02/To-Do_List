import 'package:flutter/material.dart';

class HomeList_Page extends StatefulWidget {
  const HomeList_Page({super.key});

  @override
  State<HomeList_Page> createState() => _HomeList_PageState();
}

class _HomeList_PageState extends State<HomeList_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home'),
      ),
      body: Column(
        children: [
          Hero(tag: 'iconHome',
              child: Icon(
                Icons.home,
                color: Colors.green[300],
              ),)
        ],
      ),
    );
  }
}
