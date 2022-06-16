import 'package:flutter/material.dart';
import 'package:main_page/core/shared/ui_path.dart';

class LoginHeaderNew extends StatelessWidget {
  const LoginHeaderNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      alignment: Alignment.center,
      child: Image.asset(UIPath.logo),
    );
    //SizedBox(child: Image.asset(UIPath.logo));
  }
}
