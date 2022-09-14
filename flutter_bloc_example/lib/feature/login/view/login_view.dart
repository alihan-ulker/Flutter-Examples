import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/core/constant/image_enum.dart';
import 'package:flutter_bloc_example/core/padding/page_padding.dart';
import 'package:flutter_bloc_example/core/shared/ui_text.dart';
import 'package:flutter_bloc_example/core/utility/input_decorations.dart';
import 'package:flutter_bloc_example/feature/login/viewModel/login_view_model.dart';
import 'package:kartal/kartal.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final LoginViewModel _loginViewModel;
  @override
  void initState() {
    super.initState();
    _loginViewModel = LoginViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const PagePadding.allLow(),
        child: Column(
          children: [
            //klavye acildigi zaman textfield alanini yukari kaydirir
            AnimatedContainer(
              duration: context.durationLow,
              height: context.isKeyBoardOpen ? 0 : context.dynamicHeight(0.2),
              width: context.dynamicWidth(0.3),
              child: ImageEnums.door.toImage,
            ),
            Text(
              UIText.login,
              style: context.textTheme.headline3,
            ),
            const TextField(
              decoration: ProjectInputs(UIText.name),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Center(child: Text(UIText.login)),
            ),
            CheckboxListTile(
                value: true,
                title: const Text(UIText.checkBox),
                onChanged: (value) {}),
          ],
        ),
      ),
    );
  }
}
