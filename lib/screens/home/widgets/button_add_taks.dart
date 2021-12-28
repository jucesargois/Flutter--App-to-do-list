import 'package:app_to_do_list/core/images.dart';
import 'package:app_to_do_list/screens/home/home_view.dart';
import 'package:flutter/material.dart';

class ButtonAddTasksWidget extends StatefulWidget {
  const ButtonAddTasksWidget({Key? key}) : super(key: key);

  @override
  State<ButtonAddTasksWidget> createState() => _ButtonAddTasksWidgetState();
}

class _ButtonAddTasksWidgetState extends State<ButtonAddTasksWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 44,
      child: Material(
        color: Colors.transparent,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            gradient: LinearGradient(
              begin: Alignment(0, 1.5),
              end: Alignment(0.5, 0.5),
              colors: [
                const Color(0xFF19227C),
                const Color(0xFF514AAC),
              ],
            ),
          ),
          child: Center(
            child: RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Image.asset(
                      TodoListImages.addtask,
                      scale: 25,
                    ),
                  ),
                  TextSpan(
                    text: "        ",
                  ),
                  TextSpan(
                    text: 'Adicionar Tarefa',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
