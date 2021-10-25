import 'package:injectable/injectable.dart';
import 'package:radio_life/core/data/adapter/my_devices/my_devices_extensions.dart';
import 'package:radio_life/core/data/data_sources/my_device/remote/my_device_remote_data_source.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/entities/device/device_check_register.dart';
import 'package:radio_life/core/domain/entities/device/device_entity.dart';
import 'package:radio_life/core/domain/repositories/my_device/my_device_repository.dart';
import 'package:radio_life/graphql/graphql_api.graphql.dart';

@Injectable(as: MyDeviceRepository)
class MyDeviceRepositoryImplementation extends MyDeviceRepository {
  final MyDeviceRemoteDataSource _remoteDataSource;

  MyDeviceRepositoryImplementation(this._remoteDataSource);

  @override
  Future<Resource<List<MyDeviceEntity?>>> getMyDevices() => Resource.asFuture(
        () => _remoteDataSource.getMyDevices(),
        (data) => GetMyDevices$Query.fromJson(data).toEntityList,
      );

  @override
  Future<Resource<DeviceCheckRegister>> getDeviceCheckRegister({required String serialNumber}) {
    return Resource.asFuture(
      () => _remoteDataSource.getDeviceCheckRegister(serialNumber: serialNumber),
      (data) => DeviceCheckRegister.fromJson(data),
    );
  }

  @override
  Future<Resource<String>> confirmRegister({required MyDeviceEntity entity}) {
    return Resource.asFuture(
      () => _remoteDataSource.confirmRegister(entity: entity),
      (data) {
        print(data);
        return data['deviceRegister'];
      },
    );
  }

  // @override
  // Future<Resource> confirmRegister({required String serialNumber}) {
  //   return Resource.asFuture(
  //     () => _remoteDataSource.confirmRegister(serialNumber: serialNumber),
  //     (data) => data,
  //   );
  // }
}
