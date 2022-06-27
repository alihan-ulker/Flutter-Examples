import 'package:hive/hive.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 0)
class ToDo extends HiveObject {
  @HiveField(0)
  late String description;

  @HiveField(1)
  late bool finished;

  ToDo({required this.description, this.finished = false});
}
