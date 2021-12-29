import 'package:app_to_do_list/screens/home/home_view.dart';
import 'package:flutter/material.dart';

class ContTasksWidget extends StatefulWidget {
  ContTasksWidget({Key? key}) : super(key: key);

  @override
  _ContTasksWidgetState createState() => _ContTasksWidgetState();
}

class _ContTasksWidgetState extends State<ContTasksWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Row(
        children: [
          Expanded(
            flex: -1,
            child: Align(
              alignment: Alignment(-0.9, 0.0),
              child: RichText(
                
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(text: '$continsert'),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            flex: -1,
            child: Align(
              alignment: Alignment(-0.9, 0.0),
              child: RichText(
                //componentizar
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      child: Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                    ),
                    TextSpan(text: '$contfinish'),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
