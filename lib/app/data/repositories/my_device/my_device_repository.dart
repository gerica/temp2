import 'package:radio_life/app/data/data_sources/my_device/my_device_data_source.dart';
import 'package:radio_life/app/data/model/resource.dart';
import 'package:radio_life/app/domain/entities/device/device_check_register.dart';
import 'package:radio_life/app/domain/entities/device/device_entity.dart';
import 'package:radio_life/app/domain/entities/device/device_entity_list.dart';

class MyDeviceRepository {
  final _dataSource = MyDeviceDataSource();

  @override
  Future<Resource<DeviceEntityList?>> getMyDevices() => Resource.asFuture(
        () => _dataSource.getMyDevices(),
        (data) => DeviceEntityList.fromJson(data),
      );

  @override
  Future<Resource<DeviceCheckRegister>> getDeviceCheckRegister({required String serialNumber}) {
    return Resource.asFuture(
      () => _dataSource.getDeviceCheckRegister(serialNumber: serialNumber),
      (data) => DeviceCheckRegister.fromJson(data),
    );
  }

  @override
  Future<Resource<String>> confirmRegister({required MyDeviceEntity entity}) {
    return Resource.asFuture(
      () => _dataSource.confirmRegister(entity: entity),
      (data) {
        print(data);
        return data['deviceRegister'];
      },
    );
  }

  // @override
  // Future<Resource> confirmRegister({required String serialNumber}) {
  //   return Resource.asFuture(
  //     () => _dataSource.confirmRegister(serialNumber: serialNumber),
  //     (data) => data,
  //   );
  // }
}
