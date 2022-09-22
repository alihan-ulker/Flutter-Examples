import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example_v2/core/constants/project_constant.dart';
import 'package:flutter_bloc_example_v2/core/exception/widget_not_found_exception.dart';
import 'package:flutter_bloc_example_v2/core/service/user_service.dart';
import 'package:flutter_bloc_example_v2/src/users/view_model/cubit/users_cubit_state.dart';

class UsersView extends StatelessWidget {
  UsersView({Key? key}) : super(key: key);

  final userCubit =
      UsersCubit(UserService(ProjectConstants.instance.networkManager));

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsersCubit(
        UserService(ProjectConstants.instance.networkManager),
      ),
      child: BlocConsumer<UsersCubit, UsersState>(
        listener: (context, state) {
          if (state is UserItemErrorState) {}
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: buildBodyText(state),
          );
        },
      ),
    );
  }

  Widget buildBodyText(UsersState state) {
    if (state is UsersInitial) {
      return state.buildWidget();
    } else if (state is UserLoadingState) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is UsersListItemState) {
      return Text(state.items.length.toString());
    }

    throw WidgetNotFoundException<UsersView>();
  }
}
