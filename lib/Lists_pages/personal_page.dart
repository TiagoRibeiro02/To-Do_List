import 'package:flutter/material.dart';

class Personal_Page extends StatefulWidget {
  const Personal_Page({super.key});

  @override
  State<Personal_Page> createState() => _Personal_PageState();
}

class _Personal_PageState extends State<Personal_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Personal'),
      ),
      body: Column(
        children: [
          Hero(tag: 'IconPersonal',
            child: Icon(
              Icons.person,
              color: Colors.red[300],
            ),)
        ],
      ),
    );
  }
}
