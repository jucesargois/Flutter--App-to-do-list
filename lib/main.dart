import 'package:flutter/material.dart';

import 'screens/splash/splash_view.dart';

void main() {
  runApp(const TodoListApp());
}

class TodoListApp extends StatelessWidget {
  const TodoListApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'App ToDoList',
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
