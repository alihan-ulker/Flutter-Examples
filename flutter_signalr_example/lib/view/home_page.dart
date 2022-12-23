import 'package:flutter/material.dart';
import 'package:flutter_signalr_example/service/signalr_connection_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

var signalR = SignalRProvider();

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    //For the signalr to work when the Homepage stands up.************
    signalR.initSignalR(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter SignalR Notification Example"),
      ),
      body: StreamBuilder(
        stream: streamController.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListTile(
              title: Text(signalR.message),
              subtitle: Text(signalR.fromUserName),
            );
          } else {
            return const Text("No data");
          }
        },
      ),
    );
  }
}
