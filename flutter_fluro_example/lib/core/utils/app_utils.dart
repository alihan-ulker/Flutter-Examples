import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fluro_example/core/services/route_service.dart';

class AppUtils {
  //navigation
  static void startPush(BuildContext context, {required String route}) {
    RouteService.fluroRouter.navigateTo(context, route,
        replace: false, transition: TransitionType.fadeIn);
  }

  static void startReplace(BuildContext context,
      {required String route, required bool clearStack}) {
    RouteService.fluroRouter.navigateTo(context, route,
        replace: true,
        clearStack: clearStack,
        transition: TransitionType.fadeIn);
  }
}
