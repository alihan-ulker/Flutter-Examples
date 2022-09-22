import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example_v2/core/model/regres_model.dart';
import 'package:flutter_bloc_example_v2/core/service/iuser_service.dart';

class UsersCubit extends Cubit<UsersState> {
  final IUserService userService;
  UsersCubit(this.userService) : super(UsersInitial()) {
    pageNumber = 1;
  }
  late int pageNumber = 1;
  Future<void> fecthUserItem() async {
    emit(UserLoadingState(true));
    final items = await userService.fetchUserData(page: pageNumber);
    if (items.isEmpty) {
      emit(UserItemErrorState());
    } else {
      emit(UsersListItemState(items));
    }
  }
}

abstract class UsersState {}

class UsersInitial extends UsersState {}

class UserLoadingState extends UsersState {
  final bool isLoading;
  UserLoadingState(this.isLoading);
}

class UsersListItemState extends UsersState {
  final List<Data> items;

  UsersListItemState(this.items);
}

class UserItemErrorState extends UsersState {
  UserItemErrorState();
}
