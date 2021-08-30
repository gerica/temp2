import 'package:graphql/client.dart';

abstract class MyDeviceRemoteDataSource{
  Future<QueryResult> getMyDevices();
}