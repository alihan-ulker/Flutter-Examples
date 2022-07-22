import 'package:flutter/material.dart';
import 'package:main_page/core/shared/ui_path.dart';

class LoginHeaderNew extends StatelessWidget {
  const LoginHeaderNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 60.0, right: 60.0, top: 10.0),
      child: Container(
        width: 160.0,
        height: 200.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(UIPath.logo),
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
