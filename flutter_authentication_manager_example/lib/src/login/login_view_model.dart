import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authentication_manager_example/core/auth_manager.dart';
import 'package:flutter_authentication_manager_example/core/cache_manager.dart';
import 'package:flutter_authentication_manager_example/src/home/home_view.dart';
import 'package:flutter_authentication_manager_example/src/home/model/user_model.dart';
import 'package:flutter_authentication_manager_example/src/login/login.dart';
import 'package:flutter_authentication_manager_example/src/login/model/login_request_model.dart';
import 'package:flutter_authentication_manager_example/src/login/service/login_service.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:provider/provider.dart';

abstract class LoginViewModel extends State<Login> with CacheManager {
  late final LoginService loginService;
  final _baseUrl = 'https://reqres.in';

  @override
  void initState() {
    super.initState();
    final dio = Dio(BaseOptions(baseUrl: _baseUrl));
    dio.interceptors.add(PrettyDioLogger());
    loginService = LoginService(dio);
  }

  Future<void> fetchUserLogin(String email, String password) async {
    final response = await loginService
        .fetchLogin(LoginRequestModel(email: email, password: password));

    print(response);

    if (response != null) {
      saveToken(response.token ?? '');
      navigateToHome();
      context.read<AuthenticationManager>().model = UserModel.fake();
    }
  }

  void navigateToHome() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const HomeView()));
  }
}
