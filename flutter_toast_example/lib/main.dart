import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_toast_example/core/shared/ui_text.dart';
import 'package:flutter_toast_example/core/shared/ui_theme.dart';
import 'package:flutter_toast_example/core/utils/app_config.dart';
import 'package:flutter_toast_example/src/view/home_page.dart';
import 'package:package_info_plus/package_info_plus.dart';

void main() async {
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
      title: UIText.appTitle,
      theme: mainTheme,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
