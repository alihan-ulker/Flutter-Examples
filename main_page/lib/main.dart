//@dart=2.9
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:main_page/core/models/app_config.dart';
import 'package:main_page/core/services/service_route.dart';
import 'package:main_page/core/shared/ui_text.dart';
import 'package:main_page/core/shared/ui_theme.dart';
import 'package:main_page/core/utils/localization.dart';
import 'package:main_page/src/views/view_login.dart';
import 'package:package_info_plus/package_info_plus.dart';

void main() async {
  RouteService.setupRouter();
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig.packageInfo = await PackageInfo.fromPlatform();

  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);

    var swAvailable = await AndroidWebViewFeature.isFeatureSupported(
        AndroidWebViewFeature.SERVICE_WORKER_BASIC_USAGE);
    var swInterceptAvailable = await AndroidWebViewFeature.isFeatureSupported(
        AndroidWebViewFeature.SERVICE_WORKER_SHOULD_INTERCEPT_REQUEST);

    if (swAvailable && swInterceptAvailable) {
      AndroidServiceWorkerController serviceWorkerController =
          AndroidServiceWorkerController.instance();

      serviceWorkerController.setServiceWorkerClient(AndroidServiceWorkerClient(
        shouldInterceptRequest: (request) async {
          if (kDebugMode) {
            print(request);
          }
          return null;
        },
      ));
    }
  }

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
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: RouteService.appNavigatorKey,
      localizationsDelegates: const [
        FallbackCupertinoLocalisationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('tr', 'TR'),
      ],
      title: UIText.appTitle,
      //Debug modu başlığı kapatma
      debugShowCheckedModeBanner: false,
      theme: mainTheme,
      onGenerateRoute: RouteService.router.generator,
      //Bilinmeyen yönlendirme için
      onUnknownRoute: (settings) => MaterialPageRoute(
          builder: (context) => Scaffold(
                appBar: AppBar(),
                body: const Center(
                  child: Text('Birşeyler ters gitti!'),
                ),
              )),
      home: const ViewLogin(),
    );
  }
}
