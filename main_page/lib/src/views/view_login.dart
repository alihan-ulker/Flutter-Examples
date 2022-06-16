import 'package:flutter/material.dart';
import 'package:main_page/core/shared/ui_color.dart';
import 'package:main_page/core/shared/ui_style.dart';
import 'package:main_page/core/shared/ui_text.dart';
import 'package:main_page/src/viewmodels/vm_login.dart';
import 'package:main_page/src/widgets/base_widgets.dart';
import 'package:main_page/src/widgets/widgets_login.dart';
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
    String dropdownValue = 'One';
    return Scaffold(
      backgroundColor: UIColor.white,
      body: vm.busy
          ? const ViewIndicator()
          : SafeArea(
              child: Container(
                color: Colors.grey[200],
                margin: const EdgeInsets.symmetric(horizontal: 50),
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (overscroll) {
                    bool result = false;
                    overscroll.disallowIndicator();
                    return result;
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // !vm.isActiveTentant
                        //     ? Container(
                        //         margin: const EdgeInsets.only(top: 20.0),
                        //       )
                        //     :
                        Container(
                          height: 60.0,
                          margin: const EdgeInsets.only(top: 20.0),
                          child: DropdownButton<dynamic>(
                            value: dropdownValue,
                            items: <String>['One', 'Two', 'Free', 'Four']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (v) {
                              dropdownValue = v;
                            },
                          ),
                        ),
                        const LoginHeaderNew(),
                        const SizedBox(height: 40),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LoginText(
                              text: UIText.loginWelcome,
                              maxLines: 1,
                              style:
                                  UIStyle.demibold32(color: UIColor.downriver),
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(height: 12.0),
                            LoginText(
                              text: UIText.loginNotice,
                              style:
                                  UIStyle.demibold14(color: UIColor.downriver),
                              maxLines: 2,
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(height: 24),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
