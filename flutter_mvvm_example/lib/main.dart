import 'package:flutter/material.dart';
import 'package:flutter_mvvm_example/core/shared/ui_text.dart';
import 'package:flutter_mvvm_example/src/view/todos_view.dart';
import 'package:flutter_mvvm_example/src/viewmodel/todos_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TodosViewModel>.value(value: TodosViewModel()),
      ],
      child: MaterialApp(
        title: UIText.title,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TodosView(),
      ),
    );
  }
}
