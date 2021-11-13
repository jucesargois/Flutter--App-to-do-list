import 'dart:async';

import 'package:app_to_do_list/core/colors.dart';
import 'package:app_to_do_list/core/images.dart';
import 'package:app_to_do_list/screens/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


//Terá a listagem de tarefas.
//E um botão para adicionar nova tarefa.
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
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode;
    Future.delayed(Duration(seconds: 4)).then((_){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeView()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: TodoListColors.primary,
        width: double.maxFinite,
        height: double.maxFinite,
        child: Image.asset(TodoListImages.logotodolist,scale: 5,)
      ),
    );
  }
}
