import 'package:flutter/material.dart';
import 'package:flutter_mvvm_example/core/service/todos_api_service.dart';

enum TodosState { IDLE, BUSY, ERROR }

class TodosViewModel with ChangeNotifier {
  late TodosState _todosState;
  late List todosList;

  TodosViewModel() {
    todosList = [];
    _todosState = TodosState.IDLE;
    //TodosApiService().fetchTodosList();
    fetchTodos();
  }

  TodosState get state => _todosState;
  set state(TodosState state) {
    _todosState = state;
    notifyListeners();
  }

  Future fetchTodos() async {
    try {
      state = TodosState.BUSY;

      todosList = await TodosApiService().fetchTodosList();

      //todosList = todosApiService.todosListValue;

      state = TodosState.IDLE;
      return todosList;
    } catch (e) {
      state = TodosState.ERROR;
      return [];
    }
  }
}
