import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example_3/blocs/auth/login/login_bloc.dart';
import 'package:flutter_bloc_example_3/blocs/auth/login/login_state.dart';
import 'package:flutter_bloc_example_3/repository/auth/login/login_repository.dart';
import 'package:flutter_bloc_example_3/views/auth/form_submission_status.dart';
import 'package:flutter_bloc_example_3/views/auth/login/widgets/form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginBloc(
          authRepo: context.read<LoginRepository>(),
        ),
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            final formStatus = state.formStatus;

            if (formStatus is SubmissionFailed) {
              _showSnackBar(context, formStatus.exception.toString());
            }
          },
          listenWhen: (previous, current) =>
              previous.formStatus != current.formStatus,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("assets/yoga_girl.png"),
                  FormWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
