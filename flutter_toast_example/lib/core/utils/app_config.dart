import 'dart:io';

import 'package:package_info_plus/package_info_plus.dart';

class AppConfig {
  static PackageInfo? packageInfo;

  static String appName = packageInfo!.appName;
  static String get platform => Platform.isAndroid ? 'Android' : 'iOS';
  static String get version => packageInfo!.version;
  static int get buildNumber => int.parse(packageInfo!.buildNumber);
  // static String get playStoreId => '';
  // static String get appStoreId => '';
  // static String get ipAddress => '';
  // static String get macAddress => '';
  // static String get fcmToken => '';
  // static String get uuid => '';
}
