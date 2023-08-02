import 'package:flutter/material.dart';
import 'package:todo_list/Nav_Pages/change_language.dart';
import 'package:todo_list/Nav_Pages/change_theme.dart';
import 'package:todo_list/Nav_Pages/done_list.dart';
import 'package:todo_list/Nav_Pages/feedback_wall.dart';
import 'package:todo_list/Nav_Pages/my_account.dart';
import 'package:todo_list/Nav_Pages/settings.dart';
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
        '/my_account': (context)  => My_Account(),
        '/change_language': (context)  => Change_Language(),
        '/change_theme': (context)  => Change_Theme(),
        '/done_list': (context)  => Done_List(),
        '/feedback_wall': (context)  => Feedback_Wall(),
        '/settings': (context)  => Settings(),
      },
    )
  );
}
