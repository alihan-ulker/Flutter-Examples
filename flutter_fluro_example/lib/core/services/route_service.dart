import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fluro_example/src/views/view_home.dart';
import 'package:flutter_fluro_example/src/views/view_splash.dart';
import 'package:flutter_fluro_example/src/views/view_test.dart';
import 'package:flutter_fluro_example/src/views/view_test_second.dart';
import 'package:flutter_fluro_example/src/views/view_test_third.dart';

class Routes {
  static const String splash = "/splash";
  static const String home = "/homePage";
  static const String testPage = "/testPage";
  static const String testPage2 = "/testPage2";
  static const String testPage3 = "/testPage3";
}

class RouteService {
  static FluroRouter fluroRouter = FluroRouter();
  static final appNavigatorKey = GlobalKey<NavigatorState>();

  //route handler
  static final Handler _handlerSplash =
      Handler(handlerFunc: (context, parameters) => const ViewSplash());
  static final Handler _handlerHome =
      Handler(handlerFunc: (context, parameters) => const ViewHome());
  static final Handler _handlertestPage =
      Handler(handlerFunc: (context, parameters) => const ViewTest());
  static final Handler _handlertestPage2 =
      Handler(handlerFunc: (context, parameters) => const ViewTestSecond());
  static final Handler _handlertestPage3 =
      Handler(handlerFunc: (context, parameters) => const ViewTestThird());

  static void setupRouter() {
    fluroRouter.define(Routes.splash, handler: _handlerSplash);
    fluroRouter.define(Routes.home, handler: _handlerHome);
    fluroRouter.define(Routes.testPage, handler: _handlertestPage);
    fluroRouter.define(Routes.testPage2, handler: _handlertestPage2);
    fluroRouter.define(Routes.testPage3, handler: _handlertestPage3);
  }
}
