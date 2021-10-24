import 'package:graphql/client.dart';

abstract class MyDeviceRemoteDataSource {
  Future<QueryResult> getMyDevices();

  Future<QueryResult> getDeviceCheckRegister({
    required String serialNumber,
  });

  Future<QueryResult> confirmRegister({
    required String serialNumber,
  });
}
