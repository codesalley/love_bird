import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:love_bird/controller/getDataController.dart';
import 'package:love_bird/modal/callModal.dart';

class HomeScreen extends StatelessWidget {
  final controller = GetDataController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Center(
            child: FlatButton(
              onPressed: () {
                controller.getdata();
                final callLogs = Hive.box<Call>('receivedCalls');
                print(callLogs.values.length);
                callLogs.clear();
              },
              child: Text('get Data'),
            ),
          )
        ],
      )),
    );
  }
}
