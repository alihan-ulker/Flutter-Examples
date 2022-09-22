import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example_v2/core/constants/project_constant.dart';
import 'package:flutter_bloc_example_v2/core/exception/widget_not_found_exception.dart';
import 'package:flutter_bloc_example_v2/core/service/user_service.dart';
import 'package:flutter_bloc_example_v2/src/users/view/sub_view/states_widget.dart';
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
          if (state is UsersInitial) {
            //UsersInitialWidget
            state.navigate();
          }
        },
        builder: (context, state) {
          return buildScaffold(state);
        },
      ),
    );
  }

  Scaffold buildScaffold(UsersState state) {
    return Scaffold(
      appBar: AppBar(),
      body: buildBodyText(state),
    );
  }

  Widget buildBodyText(UsersState state) {
    //UsersListItemWidget
    if (state is UsersInitial) {
      return state.buildWidget();
    } else if (state is UserLoadingState) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is UsersListItemState) {
      return NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            if (notification.metrics.pixels ==
                notification.metrics.maxScrollExtent) {
              //context.read
              final _context = notification.context;
              if (_context != null) {
                _context.read<UsersCubit>().fecthUserItemPaging();
              }
              //notification.context!.read<UsersCubit>().fecthUserItemPaging();
            }
            return true;
          },
          child: state.buildWidget());
    }

    throw WidgetNotFoundException<UsersView>();
  }
}
