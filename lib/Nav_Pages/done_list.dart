import 'package:flutter/material.dart';

class Done_List extends StatefulWidget {
  const Done_List({super.key});

  @override
  State<Done_List> createState() => _Done_ListState();
}

class _Done_ListState extends State<Done_List> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Done List'),
        centerTitle: true,
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
