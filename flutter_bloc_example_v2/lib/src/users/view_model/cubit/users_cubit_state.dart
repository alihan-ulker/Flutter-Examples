import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example_v2/core/model/regres_model.dart';
import 'package:flutter_bloc_example_v2/core/service/iuser_service.dart';

class UsersCubit extends Cubit<UsersState> {
  final IUserService userService;
  late List<Data> dataItems;
  bool _isPagingLoading = false;
  UsersCubit(this.userService) : super(UsersInitial()) {
    _pageNumber = 1;
    fecthUserItem();
  }
  late int _pageNumber = 1;
  Future<void> fecthUserItem() async {
    emit(UserLoadingState(true));
    final items = await userService.fetchUserData(page: _pageNumber);
    if (items.isEmpty) {
      emit(UserItemErrorState());
    } else {
      emit(UsersListItemState(items));
    }
    dataItems = items;
  }

  Future<void> fecthUserItemPaging() async {
    _changeLoading();
    emit(UsersListItemState(dataItems));
    if (_isPagingLoading) {
      return;
    }
    _pageNumber++;
    final items = await userService.fetchUserData(page: _pageNumber);
    _changeLoading();
    if (items.isEmpty) {
      emit(UserItemErrorState());
    } else {
      emit(UsersListItemState(items));
    }
  }

  void _changeLoading() {
    _isPagingLoading = !_isPagingLoading;
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
