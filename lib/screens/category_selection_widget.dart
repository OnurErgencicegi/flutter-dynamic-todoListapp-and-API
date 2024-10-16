import 'package:flutter/material.dart';

class CategorySelectionWidget extends StatefulWidget {
  const CategorySelectionWidget({super.key, required this.titleIcon});
  // ignore: non_constant_identifier_names
  final String titleIcon;
  @override
  State<CategorySelectionWidget> createState() =>
      _CategorySelectionWidgetState();
}

class _CategorySelectionWidgetState extends State<CategorySelectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              duration: Duration(milliseconds: 300),
              content: Text("category selected succesfuley"),
            ));
          },
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
            ),
            Image(image: AssetImage(widget.titleIcon)),
          ]))
    ]);
  }
}
