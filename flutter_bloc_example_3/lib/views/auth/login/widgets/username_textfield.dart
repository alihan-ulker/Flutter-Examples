import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example_3/blocs/auth/login/login_bloc.dart';
import 'package:flutter_bloc_example_3/blocs/auth/login/login_event.dart';
import 'package:flutter_bloc_example_3/blocs/auth/login/login_state.dart';

class UsernameTextfield extends StatelessWidget {
  const UsernameTextfield({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: ((context, state) {
        return TextFormField(
          decoration: const InputDecoration(
            icon: Icon(Icons.person),
            hintText: "Username",
          ),
          validator: (value) =>
              state.isValidUsername ? null : "Username is too short",
          onChanged: (value) => context.read<LoginBloc>().add(
                LoginUsernameChanged(username: value),
              ),
        );
      }),
    );
  }
}
