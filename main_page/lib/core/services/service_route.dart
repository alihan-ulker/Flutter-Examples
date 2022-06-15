import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:main_page/src/views/view_home.dart';
import 'package:main_page/src/views/view_login.dart';

class Routes {
  static const String login = "/login";
  static const String home = "/homePage";
}

class RouteService {
  static FluroRouter router = FluroRouter();
  static final appNavigatorKey = GlobalKey<NavigatorState>();

  //route handler
  static final Handler _handlerLogin =
      Handler(handlerFunc: (context, parameters) => const ViewLogin());
  static final Handler _handlerHome =
      Handler(handlerFunc: (context, parameters) => const ViewHome());

  static void setupRouter() {
    router.define(Routes.login, handler: _handlerLogin);
    router.define(Routes.home, handler: _handlerHome);
  }
}
