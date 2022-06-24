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
      body: context.watch<TodosViewModel>().state == TodosState.BUSY
          ? buildLoadingWidget()
          : context.watch<TodosViewModel>().state == TodosState.ERROR
              ? buildErrorWidget()
              : buildListView(context),
    );
  }

  ListView buildListView(BuildContext context) {
    return ListView.builder(
        shrinkWrap: false,
        itemBuilder: (_, index) => buildListItem(context, index));
  }

  Widget buildListItem(BuildContext context, index) {
    final todos = context.watch<TodosViewModel>().todosList[index];
    return Card(
      child: ListTile(
        title: Text(todos),
      ),
    );
  }
}
