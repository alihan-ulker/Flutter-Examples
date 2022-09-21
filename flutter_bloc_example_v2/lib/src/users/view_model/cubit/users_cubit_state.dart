import 'package:flutter_bloc/flutter_bloc.dart';

class UsersCubit extends Cubit<UserState> {
  UsersCubit() : super(UsersInitial());
}

abstract class UserState {}

class UsersInitial extends UserState {}
