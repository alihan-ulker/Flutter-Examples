import 'package:flutter/material.dart';
import 'package:flutter_bloc_example_v2/core/constants/application_constant.dart';
import 'package:flutter_bloc_example_v2/src/users/view_model/cubit/users_cubit_state.dart';

extension UsersInitialWidget on UsersInitial {
  void navigate() {}
  Widget buildWidget() {
    return const Text("Okeyy");
  }
}

extension UsersListItemWidget on UsersListItemState {
  void _navigate() {}
  Widget buildWidget() {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(items[index].avatar ??
                    ApplicationConstants.DEFAULT_IMAGE_URL),
              ),
              title: Text(items[index].email ?? ""),
            ),
          );
        });
  }
}
