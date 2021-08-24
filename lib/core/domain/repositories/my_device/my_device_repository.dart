import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/entities/device/device_entity.dart';

abstract class MyDeviceRepository {
  Future<Resource<List<MyDeviceEntity?>>> getMyDevices();
}
