import 'package:app_to_do_list/core/colors.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        gradient: LinearGradient(
          //begin: Alignment(0.01385041512548923, 0),
          end: Alignment(1, 1),
          colors: [
            const Color(0xFF514AAC),
            const Color(0xFF19227C),
          ],
        ),
      ),
      child: Row(
        children: [],
      ),
    );
  }
}
