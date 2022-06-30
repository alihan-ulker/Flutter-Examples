import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_fluro_example/core/models/app_config.dart';
import 'package:flutter_fluro_example/core/services/route_service.dart';
import 'package:flutter_fluro_example/core/shared/ui_text.dart';
import 'package:flutter_fluro_example/core/shared/ui_theme.dart';
import 'package:flutter_fluro_example/src/views/view_splash.dart';
import 'package:package_info_plus/package_info_plus.dart';

void main() async {
  RouteService.setupRouter();
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig.packageInfo = await PackageInfo.fromPlatform();

  runApp(const MyApp());

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark));
  if (kDebugMode) {
    print('\n==> Application Started!');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: RouteService.appNavigatorKey,
      title: UIText.appTitle,
      theme: mainTheme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteService.fluroRouter.generator,
      onUnknownRoute: (settings) => MaterialPageRoute(
          builder: (context) => Scaffold(
                appBar: AppBar(),
                body: Center(
                  child: Text(UIText.routeError),
                ),
              )),
      home: const ViewSplash(),
    );
  }
}
