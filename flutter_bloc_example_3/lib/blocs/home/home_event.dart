import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {}

class HomeUsernameChanged extends HomeEvent {
  final String? username;

  HomeUsernameChanged({this.username});

  @override
  List<Object?> get props => [username];
}

class HomePasswordChanged extends HomeEvent {
  final String? password;

  HomePasswordChanged({this.password});

  @override
  List<Object?> get props => [password];
}

class HomeSubmitted extends HomeEvent {
  @override
  List<Object?> get props => [];
}
