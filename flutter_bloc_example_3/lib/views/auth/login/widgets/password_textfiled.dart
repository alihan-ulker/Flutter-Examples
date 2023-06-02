import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example_3/blocs/auth/login/login_bloc.dart';
import 'package:flutter_bloc_example_3/blocs/auth/login/login_event.dart';
import 'package:flutter_bloc_example_3/blocs/auth/login/login_state.dart';

class PasswordTextfiled extends StatelessWidget {
  const PasswordTextfiled({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: ((context, state) {
        return TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
            icon: Icon(Icons.key),
            hintText: "Password",
          ),
          validator: (value) =>
              state.isValidPassword ? null : "Password is too short",
          onChanged: (value) => context.read<LoginBloc>().add(
                LoginPasswordChanged(password: value),
              ),
        );
      }),
    );
  }
}
