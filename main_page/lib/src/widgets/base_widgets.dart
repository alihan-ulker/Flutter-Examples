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

class LoginText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign textAlign;
  final int maxLines;

  const LoginText(
      {Key? key,
      required this.text,
      required this.style,
      required this.textAlign,
      required this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: style,
        overflow: TextOverflow.ellipsis,
        textAlign: textAlign,
        maxLines: maxLines);
  }
}
