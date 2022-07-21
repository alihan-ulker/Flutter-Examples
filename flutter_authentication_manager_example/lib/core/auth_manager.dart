import 'package:flutter/material.dart';
import 'package:flutter_authentication_manager_example/core/cache_manager.dart';
import 'package:flutter_authentication_manager_example/core/model/user_model.dart';

class AuthenticationManager extends CacheManager {
  BuildContext context;
  AuthenticationManager({
    required this.context,
  }) {
    fetchUserLogin();
  }

  bool isLogin = false;
  UserModel? model;

  void removeAllData() {}
  Future<void> fetchUserLogin() async {
    final token = await getToken();
    if (token != null) {
      isLogin = true;
    }
  }
}
