import 'package:graphql/client.dart';
import 'package:radio_life/core/domain/entities/device/device_entity.dart';

abstract class MyDeviceRemoteDataSource {
  Future<QueryResult> getMyDevices();

  Future<QueryResult> getDeviceCheckRegister({
    required String serialNumber,
  });

  Future<QueryResult> confirmRegister({required MyDeviceEntity entity});
}
