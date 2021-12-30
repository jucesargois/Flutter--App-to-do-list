import 'package:app_to_do_list/core/colors.dart';
import 'package:app_to_do_list/screens/home/widgets/cont_tasks.dart';
import 'package:flutter/material.dart';
import 'widgets/button_add_taks.dart';
import 'widgets/insert_task.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  

  void _editTasks(String newText, int index) {
    setState(() {
      tasks[index] = taskcontroller2.text;
    },);
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var size = mediaQuery.size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: TodoListColors.primary,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      InsertTaskWidget(),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            setState(
                              () {
                                tasks.add(taskcontroller.text);
                                listCheck.add(false);
                                setState(
                                  () {
                                    continsert = tasks.length;
                                  },
                                );
                              },
                            );
                            taskcontroller.clear();
                          }
                        },
                        child: ButtonAddTasksWidget(),
                      ),
                    ],
                  ),
                ),
              ),
              ContTasksWidget(),
              Container(
                height: 500,
                width: double.maxFinite,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(), //desabilita efeito glow
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Dismissible(
                              resizeDuration: Duration(milliseconds: 5),
                              key: ValueKey(
                                tasks[index],
                              ),
                              background: Container(
                                decoration: BoxDecoration(
                                  color: TodoListColors.dark,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                    size: 23,
                                  ),
                                ),
                              ),
                              onDismissed: (direction) {
                                tasks.removeAt(index);
                                listCheck.removeAt(index);

                                setState(
                                  () {
                                    if (listCheck == false) {
                                      contfinish -= 1;
                                    } else if (listCheck.length == 0) {
                                      contfinish = 0;
                                    }
                                    continsert = tasks.length;
                                  },
                                );
                              },
                              child: Container(
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  gradient: LinearGradient(
                                    end: Alignment(1, 1),
                                    colors: [
                                      Color(0xFF514AAC),
                                      Color(0xFF19227C),
                                    ],
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        trailing: InkWell(
                                          onTap: () {
                                            taskcontroller2.clear();
                                            editDialog(context, index);
                                          },
                                          child: Icon(
                                            Icons.edit,
                                            color: Colors.white,
                                          ),
                                        ),
                                        leading: Checkbox(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                          ),
                                          activeColor: Colors.green,
                                          value: listCheck[index],
                                          onChanged: (value) {
                                            setState(
                                              () {
                                                listCheck[index] =
                                                    !listCheck[index];
                                              },
                                            );
                                            setState(
                                              () {
                                                if (listCheck[index] == true) {
                                                  contfinish += 1;
                                                } else if (listCheck[index] ==
                                                    false) {
                                                  contfinish -= 1;
                                                }
                                              },
                                            );
                                          },
                                        ),
                                        title: Text(
                                          tasks[index],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  editDialog(BuildContext context, int index) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: TodoListColors.primary,
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            padding: EdgeInsets.all(20),
            width: 420,
            height: 280,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 170,
                  child: TextField(
                    maxLines: 30,
                    controller: taskcontroller2,
                    autofocus: true,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                    decoration: InputDecoration(
                      hintText: tasks[index],
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                        borderSide:
                            BorderSide(color: TodoListColors.light, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                        borderSide:
                            BorderSide(color: TodoListColors.light, width: 2),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  height: 44,
                  margin: EdgeInsets.only(
                    top: 25,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment(0, 1.5),
                      end: Alignment(0.5, 0.5),
                      colors: [
                        Color(0xFF19227C),
                        Color(0xFF514AAC),
                      ],
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      _editTasks(taskcontroller.text, index);
                      //  FocusScope.of(context).requestFocus(FocusNode());
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

//variaveis globais
final TextEditingController taskcontroller = TextEditingController();
final TextEditingController taskcontroller2 = TextEditingController();
List<String> tasks = [];
final formKey = GlobalKey<FormState>();
bool value = false;
bool isSelected = false;
List<bool> listCheck = [];
int continsert = 0;
int contfinish = 0;
