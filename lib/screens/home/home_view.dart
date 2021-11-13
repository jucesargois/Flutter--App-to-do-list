import 'package:app_to_do_list/core/colors.dart';
import 'package:app_to_do_list/core/images.dart';
import 'package:flutter/material.dart';

import 'widgets/card.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: TodoListColors.primary,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 360,
                height: 550,
                color: TodoListColors.primary,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(), //desabilita efeito glow
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 5),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: CardWidget()),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.bottomCenter,
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
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      splashColor: Colors.white,
                      child: Container(
                        width: 200,
                        height: 44,
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
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
