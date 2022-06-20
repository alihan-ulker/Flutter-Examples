//@dart=2.9
import 'package:flutter/material.dart';
import 'package:main_page/src/viewmodels/base_model.dart';

class VMLogin extends BaseModel {
  //AuthService _authService;
  BuildContext context;

  bool isActiveTentant;
  bool isActiveRegister;
  int activeTenantId;

  String defaultRegisterUrl = "https://ulkeralihan.com";

  int androidBuildNumber;
  int iosBuildNumber;

  //constructor
  VMLogin({@required BuildContext context}) {
    this.context;
  } //, required AuthService authService}) {

  // _authService = authService;
  // init(context);

}
