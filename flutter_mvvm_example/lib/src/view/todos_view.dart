import 'package:flutter/material.dart';
import 'package:flutter_mvvm_example/core/utils/app_bar_utils.dart';
import 'package:flutter_mvvm_example/core/utils/base_utils.dart';
import 'package:flutter_mvvm_example/src/viewmodel/todos_view_model.dart';
import 'package:provider/provider.dart';

class TodosView extends StatelessWidget {
  const TodosView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStyle(),
      body: context.read<TodosViewModel>().state == TodosState.BUSY
          ? buildLoadingWidget()
          : context.read<TodosViewModel>().state == TodosState.ERROR
              ? buildErrorWidget()
              : buildListView(context),
    );
  }

  ListView buildListView(BuildContext context) {
    return ListView.builder(
        itemBuilder: (_, index) => buildListItem(context, index));
  }

  Widget buildListItem(BuildContext context, index) {
    final todos = context.read<TodosViewModel>().todosList;
    return Card(
      child: ListTile(
        title: Text(todos.toString()),
      ),
    );
  }
}
