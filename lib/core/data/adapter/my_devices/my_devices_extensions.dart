import 'package:flinq/flinq.dart';
import 'package:radio_life/core/domain/entities/device/device_entity.dart';
import 'package:radio_life/graphql/graphql_api.graphql.dart';

extension GetMyDevices$Query$Extension on GetMyDevices$Query {
  List<MyDeviceEntity?> get toEntityList =>
      myDevice == null ? [] : myDevice!.mapList((device) => device?.toEntity);
}

extension GetMyDevices$Query$MyDeviceExtension on GetMyDevices$Query$MyDevice {
  MyDeviceEntity get toEntity => MyDeviceEntity(
        id: device,
        name: name,
        locate: locate,
        serialNumber: serialNumber,
        type: type,
        balance: balance,
        status: status,
        lastUpdate: lastUpdate,
      );
}
