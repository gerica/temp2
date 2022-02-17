import 'package:intl/intl.dart';
import 'package:radio_life/core/domain/base.dart';
import 'package:radio_life/core/domain/entities/device/device_entity.dart';

class ExamEntity extends Base {
  String? id;
  String? deviceId;
  String? serialNumber;
  String? phase;
  String? mag;
  DateTime? date;
  String? tSample;
  String? tEnvironment;
  String? plate;
  String? humidity;
  String? hall;
  String? factoryFrequency;
  String? currentFrequency;
  String? battery;
  String? freeMemory;
  String? alarm;
  String? reserve1;
  String? reserve2;
  String? reserve3;
  String? result;
  String? examNumber;
  int? credit;
  MyDeviceEntity? myDeviceEntity;

  ExamEntity({
    required this.date,
    required this.examNumber,
    required this.result,
    required this.deviceId,
    this.id,
  });

  ExamEntity.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['_id'] == null ? null : parsedJson['_id'] as String;

    date = DateFormat('dd/MM/yyyy:HH:mm:ss').parse(parsedJson['date'] ?? '').toLocal();
    deleted = parsedJson['deleted'] == null ? null : parsedJson['deleted'] as bool;
    createdAt = parsedJson['createdAt'] == null ? null : DateTime.parse(parsedJson['createdAt']).toLocal();
    updatedAt = parsedJson['updatedAt'] == null ? null : DateTime.parse(parsedJson['updatedAt']).toLocal();

    deviceId = parsedJson['deviceId'] == null ? null : parsedJson['deviceId'] as String;
    serialNumber = parsedJson['serialNumber'] == null ? null : parsedJson['serialNumber'] as String;
    phase = parsedJson['phase'] == null ? null : parsedJson['phase'] as String;
    mag = parsedJson['mag'] == null ? null : parsedJson['mag'] as String;
    tSample = parsedJson['tSample'] == null ? null : parsedJson['tSample'] as String;
    tEnvironment = parsedJson['tEnvironment'] == null ? null : parsedJson['tEnvironment'] as String;
    plate = parsedJson['plate'] == null ? null : parsedJson['plate'] as String;
    humidity = parsedJson['humidity'] == null ? null : parsedJson['humidity'] as String;
    hall = parsedJson['hall'] == null ? null : parsedJson['hall'] as String;
    factoryFrequency = parsedJson['factoryFrequency'] == null ? null : parsedJson['factoryFrequency'] as String;
    currentFrequency = parsedJson['currentFrequency'] == null ? null : parsedJson['currentFrequency'] as String;
    battery = parsedJson['battery'] == null ? null : parsedJson['battery'] as String;
    freeMemory = parsedJson['freeMemory'] == null ? null : parsedJson['freeMemory'] as String;
    alarm = parsedJson['alarm'] == null ? null : parsedJson['alarm'] as String;
    reserve1 = parsedJson['reserve1'] == null ? null : parsedJson['reserve1'] as String;
    reserve2 = parsedJson['reserve2'] == null ? null : parsedJson['reserve2'] as String;
    reserve3 = parsedJson['reserve3'] == null ? null : parsedJson['reserve3'] as String;
    result = parsedJson['result'] == null ? null : parsedJson['result'] as String;
    examNumber = parsedJson['examNumber'] == null ? null : parsedJson['examNumber'] as String;
    credit = parsedJson['credit'] == null ? null : parsedJson['credit'] as int;

    final device = parsedJson['device'];
    if (device != null) {
      myDeviceEntity = MyDeviceEntity.fromJson(device);
    }
  }

  String get resultDesc {
    if (result != null) {
      if (result == '0' || result?.toUpperCase() == 'N') {
        return 'N';
      } else if (result == '1' || result?.toUpperCase() == 'P') {
        return 'P';
      }
    }
    return '';
  }
}
