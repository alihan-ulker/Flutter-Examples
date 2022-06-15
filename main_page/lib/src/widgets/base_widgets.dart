import 'package:flutter/material.dart';
import 'package:main_page/core/shared/ui_color.dart';

class ViewIndicator extends StatelessWidget {
  const ViewIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 45,
        width: 45,
        child: CircularProgressIndicator(
            backgroundColor: Colors.transparent,
            valueColor: AlwaysStoppedAnimation<Color>(UIColor.silvertree)),
      ),
    );
  }
}
