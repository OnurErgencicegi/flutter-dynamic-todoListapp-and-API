import 'package:flutter/material.dart';
import 'package:todolistapp/model/task.dart';
import 'package:todolistapp/screens/add_new_task_screen.dart';
import 'package:todolistapp/service.dart';
import 'package:todolistapp/todoitems_customwidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

bool isChecked = false;
//List<String> todo = ["study2essons","take a walk","masturbate","yatagi topla"];
//List<String> todoComplated = ["banyo yap", "yemek ye "];

void addNewTask(Task newTask) {}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    TodoService todoService = TodoService();
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 223, 224, 250),
        body: Column(children: [
          Container(
            width: deviceWidth,
            height: deviceHeight / 3,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets2/header2.webp"),
                    fit: BoxFit.cover)),
            child: const Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Text("20.09.2024",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ),
                Text(
                  "MY TODO LIST ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: FutureBuilder(
                  future: todoService.getTodos(),
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                      return const CircularProgressIndicator();
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        primary: false,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, index) {
                          return Todoitem(task: snapshot.data![index]);
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          ),
          const Expanded(
            flex: 0,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20, top: 3, bottom: 3),
                child: Text(
                  "completed",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: FutureBuilder(
                  future: todoService.completedTodos(),
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                      return const CircularProgressIndicator();
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        primary: false,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, index) {
                          return Todoitem(task: snapshot.data![index]);
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => AddNewTaskScreen(
                            addNewTask: (newTask) => addNewTask(newTask),
                          )),
                );
              },
              child: const Text("Add new task"))
        ]),
      ),
    );
  }
}
