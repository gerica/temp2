import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/entities/device/device_check_register.dart';
import 'package:radio_life/core/domain/entities/device/device_entity.dart';
import 'package:radio_life/core/domain/entities/device/device_entity_list.dart';

abstract class MyDeviceRepository {
  Future<Resource<DeviceEntityList?>> getMyDevices();

  Future<Resource<DeviceCheckRegister>> getDeviceCheckRegister({required String serialNumber});

  Future<Resource<String>> confirmRegister({required MyDeviceEntity entity});
}
