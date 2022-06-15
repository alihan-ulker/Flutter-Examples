import 'package:flutter/material.dart';
import 'package:main_page/src/viewmodels/base_model.dart';

class VMLogin extends BaseModel {
  //AuthService _authService;
  late BuildContext context;

  late bool isActiveTentant;
  late bool isActiveRegister;
  late int activeTenantId;

  String defaultRegisterUrl = "https://ulkeralihan.com";

  late int androidBuildNumber;
  late int iosBuildNumber;

  //constructor
  VMLogin({required BuildContext context}) {
    this.context = context;
  } //, required AuthService authService}) {

  // _authService = authService;
  // init(context);

}
