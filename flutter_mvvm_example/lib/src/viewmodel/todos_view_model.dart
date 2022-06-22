import 'package:flutter/material.dart';
import 'package:flutter_mvvm_example/core/model/todos_model.dart';
import 'package:flutter_mvvm_example/core/service/todos_api_service.dart';

enum TodosState { IDLE, BUSY, ERROR }

class TodosViewModel with ChangeNotifier {
  late TodosState _todosState;

  late List<Todos> todosList;

  TodosViewModel() {
    todosList = [];
    _todosState = TodosState.IDLE;
    TodosApiService().fetchTodosList();
    fetchTodos();
  }

  TodosState get state => _todosState;
  set state(TodosState state) {
    _todosState = state;
    notifyListeners();
  }

  Future<List<Todos>> fetchTodos() async {
    try {
      state = TodosState.BUSY;
      //todosListValue değeri todosList e gelmiyor
      todosList = await TodosApiService().fetchTodosList();
      state = TodosState.IDLE;
      return todosList;
    } catch (e) {
      state = TodosState.ERROR;
      return [];
    }
  }
}
