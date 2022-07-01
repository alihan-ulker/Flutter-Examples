import 'package:flutter/material.dart';
import 'package:flutter_toast_example/core/shared/ui_text.dart';
import 'package:flutter_toast_example/core/utils/app_utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(UIText.appTitle)),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => AppUtils.showToastSort(
                context,
                msg: UIText.sortToast,
              ),
              child: Text(UIText.sortToast),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () =>
                  AppUtils.showToastLong(context, msg: UIText.longToast),
              child: Text(UIText.longToast),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () =>
                  AppUtils.showToastBottom(context, msg: UIText.bottomToast),
              child: Text(UIText.bottomToast),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () =>
                  AppUtils.showToastCenter(context, msg: UIText.centerToast),
              child: Text(UIText.centerToast),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
                onPressed: () =>
                    AppUtils.showToastTop(context, msg: UIText.topToast),
                child: Text(UIText.topToast)),
          ],
        ),
      ),
    );
  }
}
