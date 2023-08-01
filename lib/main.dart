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
        '/nav/change_language': (context)  => Change_Language(),
        '/nav/change_theme': (context)  => Change_Theme(),
        '/nav/done_list': (context)  => Done_List(),
        '/nav/feedback_wall': (context)  => Feedback_Wall(),
        '/nav/my_account': (context)  => My_Account(),
        '/nav/settings': (context)  => Settings(),
      },
    )
  );
}
