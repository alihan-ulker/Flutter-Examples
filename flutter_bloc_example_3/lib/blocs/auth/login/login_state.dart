import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_example_3/views/auth/form_submission_status.dart';

class LoginState extends Equatable {
  final String username;

  bool get isValidUsername => username.length > 3;

  final String password;
  bool get isValidPassword => password.length > 6;

  final FormSubmissionStatus formStatus;

  const LoginState({
    this.username = "",
    this.password = "",
    this.formStatus = const InitialFormStatus(),
  });

  LoginState copyWrite({
    String? username,
    String? password,
    FormSubmissionStatus? formStatus,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
    );
  }

  @override
  List<Object?> get props => [username, password, formStatus];
}