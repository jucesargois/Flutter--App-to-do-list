import 'package:flutter/material.dart';

import '../home_view.dart';

class InsertTaskWidget extends StatefulWidget {
  const InsertTaskWidget({Key? key}) : super(key: key);

  @override
  _InsertTaskWidgetState createState() => _InsertTaskWidgetState();
}

class _InsertTaskWidgetState extends State<InsertTaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: 370,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            gradient: LinearGradient(
              //begin: Alignment(0.01385041512548923, 0),
              end: Alignment(1, 1),
              colors: [
                Color(0xFF514AAC),
                Color(0xFF19227C),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: TextFormField(
                maxLines: 1,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                controller: taskcontroller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintText: 'Digite sua tarefa',
                  hintStyle: TextStyle(color: Colors.white),
                ),
                validator: (value) {
                  if (value!.isEmpty) return 'Preencher campo com a tarefa';
                  return null;
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
