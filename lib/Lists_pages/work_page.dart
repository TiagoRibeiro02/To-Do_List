import 'package:flutter/material.dart';

class Work_Page extends StatefulWidget {
  const Work_Page({super.key});

  @override
  State<Work_Page> createState() => _Work_PageState();
}

class _Work_PageState extends State<Work_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Work'),
      ),
      body: Column(
        children: [
          Hero(tag: 'IconWork',
            child: Icon(
              Icons.work,
              color: Colors.blue[400],
            ),)
        ],
      ),
    );
  }
}
