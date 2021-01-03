import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'modal/callModal.dart';
import 'view/home_screen.dart';

Future<void> main() async {
  //var path = getApplicationDocumentsDirectory();
  await Hive.initFlutter();
  Hive.registerAdapter<Call>(CallAdapter());
  await Hive.openBox<Call>('missedCalls');
  await Hive.openBox<Call>('receivedCalls');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Love Bird',
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}
