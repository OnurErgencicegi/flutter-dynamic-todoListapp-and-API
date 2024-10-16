import 'package:flutter/material.dart';
import 'package:todolistapp/constrants/task_type.dart';
import 'package:todolistapp/model/task.dart';
import 'package:todolistapp/model/todo.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key, required this.addNewTask});
  final void Function(Task newTask) addNewTask;
  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  TaskType taskType = TaskType.calendar;

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    List<String> imageAssets = [
      "lib/assets/images/category.png",
      "lib/assets/images/category_2.png",
      "lib/assets/images/category_3.png"
    ];
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 228, 230, 255),
            body: Column(
              children: [
                Container(
                  width: deviceWidth,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets2/header2.webp"),
                          fit: BoxFit.cover)),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.close),
                        iconSize: 30,
                        color: Colors.white,
                      ),
                      const Expanded(
                          child: Text(
                        "Add New Task",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ))
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    "Task Title",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                        filled: true, fillColor: Colors.white),
                  ),
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "Category",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: deviceWidth / 1.5,
                      height: deviceHeight / 10,
                      child: Row(children: [
                        GestureDetector(
                            onTap: () {
                              taskType = TaskType.calendar;
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                duration: Duration(milliseconds: 300),
                                content: Text("category selected succesfuley"),
                              ));
                            },
                            child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 15, right: 15),
                                  ),
                                  Image(
                                      image: AssetImage(
                                          "lib/assets/images/category.png")),
                                ])),
                        GestureDetector(
                            onTap: () {
                              taskType = TaskType.contest;
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                duration: Duration(milliseconds: 300),
                                content: Text("category selected succesfuley"),
                              ));
                            },
                            child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 15, right: 15),
                                  ),
                                  Image(
                                      image: AssetImage(
                                          "lib/assets/images/category_2.png")),
                                ])),
                        GestureDetector(
                            onTap: () {
                              taskType = TaskType.note;
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                duration: Duration(milliseconds: 300),
                                content: Text("category selected succesfuley"),
                              ));
                            },
                            child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 15, right: 15),
                                  ),
                                  Image(
                                      image: AssetImage(
                                          "lib/assets/images/category_3.png")),
                                ])),
                      ]),
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(right: 25, bottom: 10),
                        child: Text(
                          "date",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 25, bottom: 10),
                        child: Text(
                          "time",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: deviceWidth / 2.5,
                        child: TextField(
                          controller: dateController,
                          decoration: const InputDecoration(
                              filled: true, fillColor: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: deviceWidth / 2.5,
                        child: TextField(
                          controller: timeController,
                          decoration: const InputDecoration(
                              filled: true, fillColor: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                const Text(
                  "Description",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: TextField(
                      controller: descriptionController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.only(bottom: 300),
                      ),
                    )),
                ElevatedButton(
                    onPressed: () {
                      Todo newTask = Todo(
                        userId: -1,
                        id: -1,
                        todo: titleController.text,
                        completed: false,
                      );
                      widget.addNewTask(newTask as Task);
                      Navigator.of(context).pop();
                    },
                    child: const Text("Save"))
              ],
            )));
  }
}
