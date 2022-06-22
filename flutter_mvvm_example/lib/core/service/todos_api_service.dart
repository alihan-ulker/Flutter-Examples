import 'dart:convert';

import 'package:http/http.dart' as http;

List todosListValue = [];

class TodosApiService {
  Future fetchTodosList() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'GET', Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    request.body = '''''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var json = await response.stream.bytesToString();
      var valueMap = jsonDecode(json);

      var todos, getTodos;
      for (todos in valueMap) {
        getTodos = todos["title"];
        todosListValue.add(getTodos);
      }
      print(todosListValue);
      //print(valueMap);
    } else {
      print(response.reasonPhrase);
    }
  }
}
