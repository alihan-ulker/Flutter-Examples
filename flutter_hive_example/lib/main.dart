import 'package:flutter/material.dart';
import 'package:flutter_hive_example/core/model/todo_model.dart';
import 'package:flutter_hive_example/core/utils/ui_text.dart';
import 'package:flutter_hive_example/src/view/todo_view.dart';
import 'package:hive_flutter/hive_flutter.dart';

const todoBox = "todo";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(ToDoAdapter());

  await Hive.openBox(todoBox);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: UIText.appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ToDoView(),
    );
  }
}
