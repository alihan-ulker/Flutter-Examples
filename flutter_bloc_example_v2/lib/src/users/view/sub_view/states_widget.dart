import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc_example_v2/src/users/view_model/cubit/users_cubit_state.dart';

extension UsersInitialWidget on UsersInitial {
  Widget buildWidget() {
    return const Text("Okeyy");
  }
}

extension UsersListItemWidget on UsersListItemState {
  Widget buildWidget() {
    return ListView.builder(itemBuilder: (context, index) {
      return Card(
        child: ListTile(
          title: Text(items[index].firstName ?? ""),
        ),
      );
    });
  }
}
