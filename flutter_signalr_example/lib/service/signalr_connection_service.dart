//@dart=2.9
import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signalr_example/model/signalr_notification_model.dart';
import 'package:flutter_signalr_example/view/home_page.dart';
import 'package:signalr_netcore/signalr_client.dart';

const apiServerUrl = "http://YOUR URL ADDRESS/YOUR SIGNALR NAME";

HubConnection _hubConnection;
StreamController streamController = StreamController<String>.broadcast();

class SignalRProvider extends ChangeNotifier {
  var message, fromUserName, fromUserSurname, notificationSender;

  Future initSignalR(BuildContext context) async {
    _hubConnection = HubConnectionBuilder()
        .withUrl(apiServerUrl, options: HttpConnectionOptions())
        .withAutomaticReconnect()
        .build();

    _hubConnection.onclose(({error}) {
      log("SignalR: Connection lost!");
    });

    if (_hubConnection.state == HubConnectionState.Connected) {
      log(_hubConnection.state.toString());
    } else if (_hubConnection.state == HubConnectionState.Disconnected) {
      await _hubConnection.start();

      log("SignalR: Hub connection start");

      onReceiveMessage(List<Object> result) async {
        await getData(result);
      }

      //If you want to send notification with data from SIGNALR after logging in with user id.**************************
      //Here, sharedPreferences is used to get the userid. Your method may be different.********************************

      // SharedPreferences.getInstance().then((prefs) {
      //   String userid = prefs.getString("userid") ?? "";
      //   _hubConnection.on("ReceiveMessage-$userid", onReceiveMessage);
      //   _hubConnection.on("NotificationReceived-$userid", onReceiveMessage);
      // });
      // _hubConnection.on("ReceiveMessage-$userid", onReceiveMessage);
      // _hubConnection.on("NotificationReceived-$userid", onReceiveMessage);
      _hubConnection.on("SIGNALR NAME", onReceiveMessage);
    }
  }

  Future getData(List<Object> result) async {
    final parsed = result.cast<Map<String, dynamic>>();
    parsed
        .map<SignalRNotification>((data) => SignalRNotification.fromJson(data));
    message = SignalRNotification.fromJson(parsed[0]).message.toString();
    fromUserName =
        SignalRNotification.fromJson(parsed[0]).fromUserName.toString();
    fromUserSurname =
        SignalRNotification.fromJson(parsed[0]).fromUserSurname.toString();
    notificationSender = fromUserName + " " + fromUserSurname;

    log(message);
    log(fromUserName);
    log(fromUserSurname);

    //To open the stream after the data comes to Signalr.*********************

    if (message.toString().isNotEmpty) {
      await streamTest();
      await getStream();
    } else {
      log("Message is blank");
    }

    notifyListeners();
  }

  //It was used as a future function, not a stream, in order to wait for the incoming data to be processed.****************

  Future streamTest() async {
    if (message == null) {
      log("No Data");
    } else {
      //Data from Signalr has been added to the stream.****************************
      streamController.sink.add(signalR.message);
      streamController.sink.add(signalR.fromUserName);
    }
  }

  //Stream listening method.****************

  Future getStream() async {
    streamController.stream.listen((event) {
      log(event);
    });
  }

  @override
  notifyListeners();
}
