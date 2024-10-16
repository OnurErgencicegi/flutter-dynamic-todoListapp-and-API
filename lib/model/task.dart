import 'package:todolistapp/constrants/task_type.dart';

class Task {
  final TaskType type;
  final String title;
  bool isComplated;
  final String description;

  Task({
    required this.type,
    required this.title,
    required this.isComplated,
    required this.description,
  });
}
