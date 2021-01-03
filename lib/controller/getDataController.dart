import 'package:call_log/call_log.dart';
import 'package:hive/hive.dart';
import 'package:love_bird/modal/callModal.dart';

class GetDataController {
  // get call logs and add to database
  Future<void> getData() async {
    DateTime now = DateTime.now();

    int from = now.subtract(Duration(days: 7)).day;
    int to = now.microsecondsSinceEpoch;

    Iterable<CallLogEntry> allcalls =
        await CallLog.query(dateFrom: from, dateTo: to);
    allcalls.forEach(
      (element) {
        //if missed calls
        if (element.callType == CallType.missed) {
          addToMissedCalls(element);
        } else
        // incoming calls || received calls
        if (element.callType == CallType.incoming) {
          addToReceivedCalls(element);
        }
      },
    );
  }

  Future<void> addToMissedCalls(CallLogEntry data) async {
    final missedCalls = Hive.box<Call>('missedCalls');
    missedCalls.add(
      addData(data),
    );
  }

  Future<void> addToReceivedCalls(CallLogEntry data) async {
    final receivedCalls = await Hive.box<Call>('receivedCalls');
    receivedCalls.add(addData(data));
  }

  Future<void> addToOutgoingCalls(CallLogEntry data) async {
    final callLogs = await Hive.openBox('outgoingCalls');
  }

  Call addData(CallLogEntry data) {
    return Call(
      callerName: data.name ?? 'No Name',
      phoneNumber: data.number,
      callType: data.callType.toString().split('.')[1],
      callDuration: data.duration,
      callTimeStamp: data.timestamp,
    );
  }
}
