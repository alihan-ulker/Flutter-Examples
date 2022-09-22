import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example_v2/core/model/regres_model.dart';
import 'package:flutter_bloc_example_v2/core/service/iuser_service.dart';

class UsersCubit extends Cubit<UserState> {
  final IUserService userService;
  UsersCubit(this.userService) : super(UsersInitial()) {
    pageNumber = 1;
  }
  late int pageNumber = 1;
  Future<void> fecthUserItem() async {
    emit(UserLoadingState(true));
    final items = await userService.fetchUserData(page: pageNumber);
    //emit(UserLoadingState(false));
    emit(UsersListItemState(items));
  }
}

abstract class UserState {}

class UsersInitial extends UserState {}

class UserLoadingState extends UserState {
  final bool isLoading;
  UserLoadingState(this.isLoading);
}

class UsersListItemState extends UserState {
  final List<Data> items;

  UsersListItemState(this.items);
}
