import 'package:hive/hive.dart';

part 'callModal.g.dart';

@HiveType(typeId: 1)
class Call {
  @HiveField(1)
  String callerName;
  @HiveField(2)
  String phoneNumber;
  @HiveField(3)
  var callType;
  @HiveField(4)
  var callDuration;
  @HiveField(5)
  var callTimeStamp;

  Call({
    this.phoneNumber,
    this.callerName,
    this.callType,
    this.callDuration,
    this.callTimeStamp,
  });
}
