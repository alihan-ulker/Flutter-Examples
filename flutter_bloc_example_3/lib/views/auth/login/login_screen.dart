import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example_3/blocs/auth/login/login_bloc.dart';
import 'package:flutter_bloc_example_3/blocs/auth/login/login_state.dart';
import 'package:flutter_bloc_example_3/repository/auth/login/login_repository.dart';

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
          listener: (context, state) {},
          listenWhen: (previous, current) =>
              previous.formStatus != current.formStatus,
          child: Center(
            child: Column(
              children: [
                Image.asset("assets/yoga_girl.png"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
