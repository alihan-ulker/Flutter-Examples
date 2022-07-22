import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_mvvm_example/core/constant/app_constant.dart';
import 'package:http/http.dart' as http;

class TodosApiService {
  late List todosListValue = [];

  Future fetchTodosList() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('GET', Uri.parse(AppConstant.appUrl));
    request.body = '''''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var json = await response.stream.bytesToString();
      var valueMap = jsonDecode(json);

      // ignore: prefer_typing_uninitialized_variables
      var todos, getTodos;
      for (todos in valueMap) {
        getTodos = todos["title"];
        todosListValue.add(getTodos);
      }
      if (kDebugMode) {
        print("Todos List: $todosListValue");
      }
    } else {
      if (kDebugMode) {
        print(response.reasonPhrase);
      }
    }

    return todosListValue;
  }
}
