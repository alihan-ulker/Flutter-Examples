import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc_example/core/models/project_context_model.dart';
import 'package:flutter_bloc_example/core/models/user_context_model.dart';
import 'package:flutter_bloc_example/feature/login/view/login_view.dart';
import 'package:flutter_bloc_example/feature/onboard/on_board_view.dart';
import 'package:provider/provider.dart';
//import 'package:flutter_bloc_example/feature/onboard/on_board_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //Provider(create: (context) => UserContext("a")),
        //kullaici isminde guncelleme yapabilmek icin ProxyProvider in update ozelligi kullanildi
        ProxyProvider<ProductContext, UserContext?>(
            update: (context, productContext, userContext) {
          return userContext != null
              ? userContext.copyWith(name: productContext.newUserName)
              : UserContext(productContext.newUserName);
        }),
        ChangeNotifierProvider(create: (context) => ProductContext()),
      ],
      child: MaterialApp(
        title: 'Flutter Bloc Example',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
            appBarTheme: const AppBarTheme(
              elevation: 0,
              backgroundColor: Colors.transparent,
              systemOverlayStyle: SystemUiOverlayStyle.dark,
            ),
            scaffoldBackgroundColor: Colors.grey[300],
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Color.fromRGBO(11, 23, 84, 1))),
        home: const OnBoardView(),
        //home: const LoginView(),
      ),
    );
  }
}
