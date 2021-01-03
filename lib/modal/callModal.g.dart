// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'callModal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CallAdapter extends TypeAdapter<Call> {
  @override
  final int typeId = 1;

  @override
  Call read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Call(
      phoneNumber: fields[2] as String,
      callerName: fields[1] as String,
      callType: fields[3] as dynamic,
      callDuration: fields[4] as dynamic,
      callTimeStamp: fields[5] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, Call obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.callerName)
      ..writeByte(2)
      ..write(obj.phoneNumber)
      ..writeByte(3)
      ..write(obj.callType)
      ..writeByte(4)
      ..write(obj.callDuration)
      ..writeByte(5)
      ..write(obj.callTimeStamp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CallAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
