import 'package:app_to_do_list/core/colors.dart';
import 'package:flutter/material.dart';

class PopUpItemBody extends StatelessWidget {
  const PopUpItemBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Título',
              hintStyle: TextStyle(color: Colors.white),
              border: InputBorder.none,
            ),
            cursorColor: Colors.white,
          ),
          const Divider(
            color: TodoListColors.dark,
            thickness: 0.2,
          ),
          const TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText:
                  'Escreva teu textinho aqui ', //"emogi" inserir algum emoji.
              hintStyle: TextStyle(color: Colors.white),
              border: InputBorder.none,
            ),
            cursorColor: Colors.white,
            maxLines: 6,
          ),
          const Divider(
            color: TodoListColors.dark,
            thickness: 0.3,
          ),
          TextButton(
            onPressed: () {},
            child:
                const Text('Adicionar', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
