import 'package:flutter/material.dart';
import 'package:todo_list/Pages/home.dart';
import 'package:todo_list/Pages/login.dart';
import 'package:todo_list/Pages/register.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/': (context) => Login(),
        '/register': (context) => Register(),
        '/home': (context)  => home_page(),
      },
    )
  );
}
