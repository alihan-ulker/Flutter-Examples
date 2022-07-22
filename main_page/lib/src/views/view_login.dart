import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:main_page/core/shared/ui_color.dart';
import 'package:main_page/core/shared/ui_style.dart';
import 'package:main_page/core/shared/ui_text.dart';
import 'package:main_page/src/viewmodels/vm_login.dart';
import 'package:main_page/src/views/view_home.dart';
import 'package:main_page/src/widgets/base_widgets.dart';
import 'package:main_page/src/widgets/widgets_login.dart';
import 'package:provider/provider.dart';

class ViewLogin extends StatefulWidget {
  const ViewLogin({Key? key}) : super(key: key);

  @override
  State<ViewLogin> createState() => _ViewLoginState();
}

class _ViewLoginState extends State<ViewLogin> {
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

  final _formKey = GlobalKey<FormState>();

  bool _isObscure = true;

  bool isLoading = false;

  String? userNameOrEmailAddress, password;

  Widget body(BuildContext context, {required VMLogin vm}) {
    String dropdownValue = 'One';
    return Scaffold(
      backgroundColor: UIColor.white,
      body: vm.busy
          ? const ViewIndicator()
          : SafeArea(
              child: Form(
                key: _formKey,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (overscroll) {
                      bool result = false;
                      overscroll.disallowIndicator();
                      return result;
                    },
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 60.0,
                            margin: const EdgeInsets.only(top: 20.0),
                            child: DropdownButton<String>(
                              value: dropdownValue,
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
                              items: <String>[
                                'One',
                                'Two',
                                'Tree',
                                'Four'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                          //Login Logo
                          const LoginHeader(),
                          const SizedBox(height: 20),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LoginText(
                                text: UIText.loginWelcome,
                                maxLines: 1,
                                style: UIStyle.demibold32(
                                    color: UIColor.downriver),
                                textAlign: TextAlign.start,
                              ),
                              const SizedBox(height: 12.0),
                              LoginText(
                                text: UIText.loginNotice,
                                style: UIStyle.demibold14(
                                    color: UIColor.downriver),
                                maxLines: 2,
                                textAlign: TextAlign.start,
                              ),
                              const SizedBox(height: 8.0),
                              TextFormField(
                                autocorrect: true,
                                decoration: InputDecoration(
                                  hintText: UIText.email,
                                  prefixIcon:
                                      const Icon(Icons.supervised_user_circle),
                                  errorStyle: const TextStyle(fontSize: 14.0),
                                ),
                                validator: (inputValue) {
                                  if (inputValue!.isEmpty) {
                                    return UIText.emailError;
                                  }
                                  return null;
                                },
                                onSaved: (inputValue) =>
                                    userNameOrEmailAddress = inputValue!,
                              ),
                              const SizedBox(height: 8.0),
                              TextFormField(
                                obscureText: _isObscure,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.lock),
                                  hintText: UIText.password,
                                  errorStyle: const TextStyle(fontSize: 14.0),
                                  suffix: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isObscure = !_isObscure;
                                      });
                                    },
                                    icon: Icon(
                                      _isObscure
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                  ),
                                ),
                                validator: (inputValue) {
                                  if (inputValue!.isEmpty) {
                                    return UIText.passwordError;
                                  } else if (inputValue.trim().length < 6) {
                                    return UIText.passwordWarning;
                                  }
                                  return null;
                                },
                                onSaved: (inputValue) => password = inputValue!,
                              ),
                              const SizedBox(height: 12.0),
                              TextButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(UIText.passwordForget),
                                    ),
                                  );
                                },
                                child: InkWell(
                                    child: Row(
                                  children: [
                                    Text(
                                      UIText.passwordRemember,
                                      style: TextStyle(
                                        color: Colors.green[700],
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ],
                                )),
                              ),
                              const SizedBox(height: 12.0),
                              Center(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.orange[700],
                                    shape: const StadiumBorder(),
                                  ),
                                  onPressed: isLoading ? null : submit,
                                  child: (isLoading)
                                      ? const SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                            strokeWidth: 1.5,
                                          ))
                                      : Text(UIText.buttonLogin),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  //login button control
  void submit() async {
    setState(() {
      isLoading = true;
    });
    login();
    await Future.delayed(const Duration(seconds: 3));

    setState(() {
      isLoading = false;
    });
  }

  Future<void> login() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      if (kDebugMode) {
        print("Login: Giriş formatları uygun");
      }

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const ViewHome()));
      //Form values reset
      _formKey.currentState!.reset();
    } else {
      if (kDebugMode) {
        print("Login: Giriş formatları uygun değil!");
      }
      return;
    }
  }
}
