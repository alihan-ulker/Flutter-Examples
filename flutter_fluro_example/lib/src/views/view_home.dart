import 'package:flutter/material.dart';
import 'package:flutter_fluro_example/core/services/route_service.dart';
import 'package:flutter_fluro_example/core/shared/ui_text.dart';
import 'package:flutter_fluro_example/core/utils/app_utils.dart';

class ViewHome extends StatelessWidget {
  const ViewHome({Key? key}) : super(key: key);

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
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    AppUtils.startPush(context, route: Routes.testPage);
                  },
                  child: Text(UIText.buttonTest),
                ),
                const SizedBox(width: 10.0),
                ElevatedButton(
                  onPressed: () {
                    AppUtils.startPush(context, route: Routes.testPage2);
                  },
                  child: Text(UIText.buttonTest2),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
