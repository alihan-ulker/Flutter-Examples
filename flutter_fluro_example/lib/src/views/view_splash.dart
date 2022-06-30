import 'package:flutter/material.dart';
import 'package:flutter_fluro_example/core/services/route_service.dart';
import 'package:flutter_fluro_example/core/shared/ui_text.dart';
import 'package:flutter_fluro_example/core/utils/app_utils.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ViewSplash extends StatefulWidget {
  const ViewSplash({Key? key}) : super(key: key);

  @override
  State<ViewSplash> createState() => _ViewSplashState();
}

class _ViewSplashState extends State<ViewSplash>
    with SingleTickerProviderStateMixin {
  late SpinKitSquareCircle spinKitSquareCircle;

  @override
  void initState() {
    super.initState();
    spinKitSquareCircle = SpinKitSquareCircle(
      color: Colors.black45,
      size: 60.0,
      controller: AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 3000),
      ),
    );

    Future.delayed(const Duration(seconds: 5), () async {
      AppUtils.startPush(context, route: Routes.home);
    });
  }

  @override
  void dispose() {
    super.dispose();
    AppUtils.startPush(context, route: Routes.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(UIText.appTitle),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 160.0),
              child: spinKitSquareCircle,
            )
          ],
        ),
      ),
    );
  }
}
