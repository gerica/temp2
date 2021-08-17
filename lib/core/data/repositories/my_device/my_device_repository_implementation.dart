import 'package:injectable/injectable.dart';
import 'package:radio_life/core/data/data_sources/my_device/remote/my_device_remote_data_source.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/entities/device/device_entity.dart';
import 'package:radio_life/core/domain/repositories/my_device/my_device_repository.dart';

@Injectable(as: MyDeviceRepository)
class MyDeviceRepositoryImplementation extends MyDeviceRepository {
  final MyDeviceRemoteDataSource _remoteDataSource;

  MyDeviceRepositoryImplementation(this._remoteDataSource);

  @override
  Future<Resource<List<DeviceEntity>>> getMyDevices() => Resource.asFuture(
        () => _remoteDataSource.getMyDevices(),
        (data) => data,
      );
}
