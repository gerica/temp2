import 'package:graphql/client.dart';
import 'package:injectable/injectable.dart';
import 'package:radio_life/core/data/data_sources/my_device/remote/confirm_register_device_mutation.dart';
import 'package:radio_life/core/data/data_sources/my_device/remote/my_device_remote_data_source.dart';
import 'package:radio_life/core/domain/entities/device/device_entity.dart';
import 'package:radio_life/graphql/graphql_api.graphql.dart';

import 'device_check_register_query.dart';

@Injectable(as: MyDeviceRemoteDataSource)
class MyDeviceRemoteDataSourceImplementation extends MyDeviceRemoteDataSource {
  final GraphQLClient _graphQLClient;

  MyDeviceRemoteDataSourceImplementation(this._graphQLClient);

  @override
  Future<QueryResult> getMyDevices() {
    final query = GetMyDevicesQuery();
    return _graphQLClient.query(QueryOptions(document: query.document));
  }

  @override
  Future<QueryResult> getDeviceCheckRegister({required String serialNumber}) {
    final query = DeviceCheckRegisterQuery(serialNumber: serialNumber);
    return _graphQLClient.query(
      QueryOptions(
        document: query.document,
        variables: query.variables,
      ),
    );
  }

  @override
  Future<QueryResult> confirmRegister({required MyDeviceEntity entity}) {
    final mutation = ConfirmRegisterDeviceMutation(entity: entity);
    return _graphQLClient.mutate(
      MutationOptions(
        document: mutation.document,
        variables: mutation.variables,
      ),
    );
  }
}
