import 'package:flutter/material.dart';
import 'package:todo_list/Pages/login.dart';
import 'package:todo_list/Pages/register.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/register': (context) => Register(),
      },
    )
  );
}
