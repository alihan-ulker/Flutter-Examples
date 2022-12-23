//@dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_signalr_example/service/signalr_connection_service.dart';
import 'package:flutter_signalr_example/view/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

//A sample Flutter application written to instantly transfer the live notification data received
//from websocket with Signalr to the ui side by broadcasting with Stream.

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignalRProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter SignalR Notification Example',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
