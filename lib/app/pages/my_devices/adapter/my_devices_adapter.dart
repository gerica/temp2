import 'package:radio_life/core/domain/entities/device/device_entity.dart';

extension MyDeviceListExtension on List<MyDeviceEntity?> {
  List<MyDeviceEntity?> get toModelList => map((e) => e?.toModel).toList();
}

extension MyDeviceEntityExtension on MyDeviceEntity {
  MyDeviceEntity get toModel {
    return MyDeviceEntity(
        id: id ?? '',
        name: name,
        locate: locate,
        serialNumber: serialNumber,
        type: type,
        balance: balance,
        status: status,
        lastUpdate: lastUpdate);
  }
}
