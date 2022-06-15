import 'package:flutter/material.dart';
import 'package:main_page/core/shared/ui_color.dart';
import 'package:main_page/src/viewmodels/vm_login.dart';
import 'package:main_page/src/widgets/base_widgets.dart';
import 'package:provider/provider.dart';

class ViewLogin extends StatelessWidget {
  const ViewLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => VMLogin(
        context: context,
      ), //authService: Provider.of(context, listen: false),),
      builder: (context, child) {
        return Consumer<VMLogin>(
          builder: (context, vm, child) {
            return body(context, vm: vm);
          },
        );
      },
    );
  }

  Widget body(BuildContext context, {required VMLogin vm}) {
    return Scaffold(
      backgroundColor: UIColor.white,
      body: const Scaffold(),
    );
  }
}
