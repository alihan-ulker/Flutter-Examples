import 'package:flutter/material.dart';
import 'package:flutter_fluro_example/core/services/route_service.dart';
import 'package:flutter_fluro_example/core/shared/ui_text.dart';
import 'package:flutter_fluro_example/core/utils/app_utils.dart';

class ViewTest extends StatelessWidget {
  const ViewTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
            child: Text(UIText.appTitle),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                UIText.testPage,
                style: const TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                AppUtils.startPush(context, route: Routes.home);
              },
              child: Text(UIText.testsBackButton),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                AppUtils.startPush(context, route: Routes.testPage2);
              },
              child: Text(UIText.test2Button),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                AppUtils.startPush(context, route: Routes.testPage3);
              },
              child: Text(UIText.test3Button),
            ),
          ],
        ));
  }
}
