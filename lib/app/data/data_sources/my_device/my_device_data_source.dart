import 'package:graphql/client.dart';
import 'package:radio_life/app/data/data_sources/datasource_base.dart';
import 'package:radio_life/app/data/data_sources/my_device/confirm_register_device_mutation.dart';
import 'package:radio_life/app/data/data_sources/my_device/get_my_devices_query.dart';
import 'package:radio_life/app/domain/entities/device/device_entity.dart';

import 'device_check_register_query.dart';

class MyDeviceDataSource extends DataSourceBase {
  MyDeviceDataSource() : super();

  @override
  Future<QueryResult> getMyDevices() {
    final query = GetMyDevicesQuery();
    return graphQLClient.query(QueryOptions(document: query.document));
  }

  @override
  Future<QueryResult> getDeviceCheckRegister({required String serialNumber}) {
    final query = DeviceCheckRegisterQuery(serialNumber: serialNumber);
    return graphQLClient.query(
      QueryOptions(
        document: query.document,
        variables: query.variables,
      ),
    );
  }

  @override
  Future<QueryResult> confirmRegister({required MyDeviceEntity entity}) {
    final mutation = ConfirmRegisterDeviceMutation(entity: entity);
    return graphQLClient.mutate(
      MutationOptions(
        document: mutation.document,
        variables: mutation.variables,
      ),
    );
  }
}
