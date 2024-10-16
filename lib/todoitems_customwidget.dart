import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todolistapp/model/todo.dart';

class Todoitem extends StatefulWidget {
  const Todoitem({super.key, required this.task});
  final Todo task;

  @override
  State<Todoitem> createState() => _TodoitemState();
}

class _TodoitemState extends State<Todoitem> {
  var intValue = Random().nextInt(3); // Value is >= 0 and < 10.

  List<String> imageAssets = [
    "lib/assets/images/category.png",
    "lib/assets/images/category_2.png",
    "lib/assets/images/category_3.png"
  ];
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    // double deviceHeight = MediaQuery.of(context).size.height;
    return Card(
      color: widget.task.completed!
          ? const Color.fromARGB(255, 188, 185, 247)
          : Colors.white,
      child: SizedBox(
        height: 75,
        child: Row(
          children: [
            Expanded(flex: 2, child: Image.asset(imageAssets[intValue])),
            Expanded(
              flex: 5,
              child: SizedBox(
                height: 20,
                width: (deviceWidth / 3) * 2,
                child: Text(
                  widget.task.todo!,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    decoration: widget.task.completed!
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Checkbox(
                  value: widget.task.completed,
                  onChanged: (val) => {
                        setState(() {
                          widget.task.completed = widget.task.completed!;
                        })
                      }),
            )
          ],
        ),
      ),
    );

    // hatayı bul
    /*Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: Card(
          color: widget.task.completed!
              ? const Color.fromARGB(255, 188, 185, 247)
              : Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                /*widget.task.type == TaskType.calendar
                    ? Image.asset("lib/assets/images/category.png")
                    : widget.task.type == TaskType.contest
                        ? Image.asset("lib/assets/images/category_2.png")
                        */
                Image.asset("lib/assets/images/category_3.png"),
                Column(children: [
                  Text(widget.task.todo!,
                      style: TextStyle(
                          decoration: widget.task.completed!
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 37,
                    width: deviceWidth / 2,
                    child: ClipRect(
                      child: Text(
                        widget.task.todo!,
                        style: TextStyle(
                          decoration: widget.task.completed!
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          fontSize: 13,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ]),
                Checkbox(
                    value: widget.task.completed,
                    onChanged: (val) => {
                          setState(() {
                            widget.task.completed = widget.task.completed!;
                          })
                        })
              ],
            ),
          )),
    );*/
  }
}
