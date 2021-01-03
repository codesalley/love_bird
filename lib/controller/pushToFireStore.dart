import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import 'package:love_bird/controller/getDataController.dart';
import 'package:love_bird/modal/callModal.dart';

class DataBase {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final controller = GetDataController();
  final callLogs = Hive.box<Call>('receivedCalls');

  Future<void> pushToClound() async {
    CollectionReference fireStoreCalls = firestore.collection('missed-calls');
    if (callLogs.values.isNotEmpty) {
      callLogs.values.forEach((element) async {
        await fireStoreCalls.add({
          'date': element.callTimeStamp,
          'duration': element.callDuration,
          'name': element.callerName,
          'number': element.phoneNumber,
          'type': element.callType
        }).whenComplete(() => print('sent'));
      });
    } else {
      controller.getData();
    }
  }
}
