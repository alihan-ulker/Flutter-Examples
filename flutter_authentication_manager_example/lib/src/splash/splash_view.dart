// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_authentication_manager_example/core/auth_manager.dart';
import 'package:flutter_authentication_manager_example/src/home/home_view.dart';
import 'package:flutter_authentication_manager_example/core/model/user_model.dart';
import 'package:flutter_authentication_manager_example/src/login/login.dart';
import 'package:provider/provider.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Future<void> controlToApp() async {
    await readAuthManager.fetchUserLogin();
    if (readAuthManager.isLogin) {
      await Future.delayed(const Duration(seconds: 5));
      readAuthManager.model = UserModel.fake();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const HomeView()));
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Login()));
    }
  }

  AuthenticationManager get readAuthManager =>
      context.read<AuthenticationManager>();

  @override
  void initState() {
    super.initState();
    controlToApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          // width: 160.0,
          // height: 200.0,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/image/splash.gif"),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ),
    );
  }
}
