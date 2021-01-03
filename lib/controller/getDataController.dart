import 'package:call_log/call_log.dart';
import 'package:hive/hive.dart';
import 'package:love_bird/modal/callModal.dart';

class GetDataController {
  // get call logs and add to database
  Future<void> getdata() async {
    Iterable<CallLogEntry> callLogs = await CallLog.get();
    callLogs.forEach(
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
      callType: data.callType.toString().split('.')[0],
      callDuration: data.duration,
      callTimeStamp: data.timestamp,
    );
  }
}
