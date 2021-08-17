import 'package:graphql/client.dart';
import 'package:injectable/injectable.dart';
import 'package:radio_life/core/data/data_sources/my_device/remote/my_device_remote_data_source.dart';

@Injectable(as: MyDeviceRemoteDataSource)
class MyDeviceRemoteDataSourceImplementation extends MyDeviceRemoteDataSource {
  final GraphQLClient _graphQLClient;

  MyDeviceRemoteDataSourceImplementation(this._graphQLClient);

  @override
  Future<QueryResult> getMyDevices() {
    // TODO(anyOne): implement getMyDevices
    throw UnimplementedError();
  }
}
