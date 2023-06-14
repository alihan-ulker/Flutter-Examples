import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_example_3/blocs/bloc_status.dart';

class RegisterState extends Equatable {
  final String email;
  bool get isValidEmail => email.length > 3;

  final String password;
  bool get isValidPassword => password.length > 6;

  final AppSubmissionStatus appStatus;

  const RegisterState({
    this.email = '',
    this.password = '',
    this.appStatus = const InitialStatus(),
  });

  RegisterState copyWith({
    String? email,
    String? password,
    AppSubmissionStatus? appStatus,
  }) {
    return RegisterState(
      email: email ?? this.email,
      password: password ?? this.password,
      appStatus: appStatus ?? this.appStatus,
    );
  }

  @override
  List<Object?> get props => [email, password, appStatus];
}
