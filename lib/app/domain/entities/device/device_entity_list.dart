import 'package:radio_life/app/domain/entities/device/device_entity.dart';

class DeviceEntityList {
  int? count;
  List<MyDeviceEntity> items = [];

  DeviceEntityList.fromJson(Map<String, dynamic> parsedJson) {
    count = parsedJson['count'] == null ? null : parsedJson['count'] as int;
    final exams = parsedJson['items'];
    items = [];
    if (exams != null && exams.length > 0) {
      for (final objJson in exams) {
        items.add(MyDeviceEntity.fromJson(objJson));
      }
    }
  }
}
