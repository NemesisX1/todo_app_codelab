import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/widgets/todo_task.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

//<>
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ma Todo App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xffDADADA),
      ),
      home: const HomePage(),
    );
  }
}
