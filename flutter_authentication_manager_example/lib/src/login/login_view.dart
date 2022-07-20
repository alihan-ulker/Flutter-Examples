import 'package:flutter/material.dart';
import 'package:flutter_authentication_manager_example/core/shared/ui_text.dart';
import 'package:flutter_authentication_manager_example/src/login/login_view_model.dart';

class LoginView extends StatefulWidget with LoginViewModel {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(UIText.appTitle),
      ),
      body: Center(
        child: Wrap(
          runSpacing: 10,
          runAlignment: WrapAlignment.center,
          alignment: WrapAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: UIText.emailText),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: UIText.passwordText),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {},
                child: const Icon(Icons.login),
              ),
            )
          ],
        ),
      ),
    );
  }
}
