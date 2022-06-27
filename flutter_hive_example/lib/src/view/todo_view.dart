import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hive_example/core/model/todo_model.dart';
import 'package:flutter_hive_example/core/utils/ui_text.dart';
import 'package:flutter_hive_example/main.dart';
import 'package:flutter_hive_example/src/widget/base_widget.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ToDoView extends StatefulWidget {
  const ToDoView({Key? key}) : super(key: key);

  @override
  State<ToDoView> createState() => _ToDoViewState();
}

class _ToDoViewState extends State<ToDoView> {
  final _controller = TextEditingController();
  final _todoBox = Hive.box(todoBox);
  final _todosList = [
    ToDo(description: "Deneme", finished: false),
    ToDo(description: "Deneme2", finished: false),
    ToDo(description: "Deneme3", finished: false),
    ToDo(description: "Deneme4", finished: false),
    ToDo(description: "Deneme5", finished: false),
    ToDo(description: "Deneme6", finished: false),
  ];

  @override
  void initState() {
    super.initState();
    for (var t in _todoBox.values) {
      if (kDebugMode) {
        print(t.finished);
      }
    }
    if (_todoBox.length == 0) _todoBox.addAll(_todosList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(UIText.appTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(hintText: "Yeni Görev Ekle"),
              onSubmitted: (sub) {
                _todoBox.add(ToDo(description: sub, finished: false));
              },
            ),
            const SizedBox(height: 12.0),
            Expanded(
              child: ValueListenableBuilder<Box>(
                valueListenable: _todoBox.listenable(),
                builder: (context, box, index) {
                  return ListView.builder(
                    itemCount: box.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ToDoBase(
                          description:
                              _todoBox.values.elementAt(index).description,
                          finished: _todoBox.values.elementAt(index).finished,
                          onFinished: () {
                            setState(() {
                              _todoBox.putAt(
                                index,
                                ToDo(
                                  description: _todoBox.values
                                      .elementAt(index)
                                      .description,
                                  finished: !_todoBox.values
                                      .elementAt(index)
                                      .finished,
                                ),
                              );
                            });
                          },
                          onDelete: () {
                            _todoBox.deleteAt(index);
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
