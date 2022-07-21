import 'package:radio_life/app/domain/entities/device/device_entity.dart';

class DeviceEntityList {
  int? count;
  List<MyDeviceEntity> items = [];

  DeviceEntityList.fromJson(Map<String, dynamic> parsedJson) {
    final devices = parsedJson['myDevice'];
    items = [];
    count = 0;
    if (devices != null && devices.length > 0) {
      for (final objJson in devices) {
        items.add(MyDeviceEntity.fromJson(objJson));
        count = count! + 1;
      }
    }
  }
}
