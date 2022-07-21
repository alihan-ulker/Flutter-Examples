import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_authentication_manager_example/src/login/model/login_request_model.dart';
import 'package:flutter_authentication_manager_example/src/login/model/login_response_model.dart';

abstract class ILoginService {
  final String path = '/api/login';

  ILoginService(this.dio);

  Future<LoginResponseModel?> fetchLogin(LoginRequestModel model);
  final Dio dio;
}

class LoginService extends ILoginService {
  LoginService(Dio dio) : super(dio);

  @override
  Future<LoginResponseModel?> fetchLogin(LoginRequestModel model) async {
    final response = await dio.post(path, data: model);

    if (response.statusCode == HttpStatus.ok) {
      return LoginResponseModel.fromJson(response.data);
    }

    return null;
  }
}
