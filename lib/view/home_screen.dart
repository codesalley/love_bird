import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:love_bird/controller/getDataController.dart';
import 'package:love_bird/controller/pushToFireStore.dart';
import 'package:love_bird/modal/callModal.dart';

class HomeScreen extends StatelessWidget {
  final controller = GetDataController();
  final firestoreController = DataBase();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Center(
            child: FlatButton(
              onPressed: () {
                controller.getData();
                firestoreController.pushToClound();
                final callLogs = Hive.box<Call>('receivedCalls');
                final missedcalls = Hive.box('missedCalls');
                print(callLogs.values.elementAt(2).callTimeStamp);
                callLogs.clear();
                missedcalls.clear();
              },
              child: Text('get Data'),
            ),
          )
        ],
      )),
    );
  }
}
