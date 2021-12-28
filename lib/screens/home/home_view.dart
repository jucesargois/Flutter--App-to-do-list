import 'package:app_to_do_list/core/colors.dart';
import 'package:flutter/material.dart';
import 'widgets/button_add_taks.dart';

final TextEditingController taskcontroller = TextEditingController();
List<String> tasks = [];
final formKey = GlobalKey<FormState>();
bool value = false;
bool isSelected = false;
List<bool> listCheck = [];

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Color color = TodoListColors.primary;

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
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Form(
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
                                maxLines: 2,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                                controller: taskcontroller,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  hintText: 'Digite sua tarefa',
                                  hintStyle: TextStyle(color: Colors.white),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty)
                                    return 'Preencher campo com a tarefa';
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            tasks.add(taskcontroller.text);
                            listCheck.add(false);
                          });
                          taskcontroller.clear();
                        }
                      },
                      child: ButtonAddTasksWidget(),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.maxFinite,
                height: double.maxFinite,
                color: TodoListColors.primary,
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
                                // color: TodoListColors.dark,
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
                                listCheck = [
                                  false
                                ]; // para corrigir(quando finaliza todas as tarefas e inserir outras, checkbox continuar desmarcada)
                              },
                              child: Container(
                                width: 300,
                                //height: 65,
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
                                      Align(
                                        child: ListTile(
                                          leading: Checkbox(
                                            value: listCheck[index],
                                            onChanged: (value) {
                                              setState(() {
                                                listCheck[index] =
                                                    !listCheck[index];
                                              });
                                            },
                                          ),
                                          title: Text(
                                            tasks[index],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400),
                                          ),
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
}
