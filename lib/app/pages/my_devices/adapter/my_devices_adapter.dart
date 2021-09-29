import 'package:intl/intl.dart';
import 'package:radio_life/app/pages/my_devices/model/my_device_model.dart';
import 'package:radio_life/core/domain/entities/device/device_entity.dart';

extension MyDeviceListExtension on List<MyDeviceEntity?> {
  List<MyDeviceModel?> get toModelList => map((e) => e?.toModel).toList();
}

extension MyDeviceEntityExtension on MyDeviceEntity {
  MyDeviceModel get toModel {
    final balanceString = balance.toString();
    final dateFormat = DateFormat('MM/dd/yyyy');
    final lasUpdateString =
        lastUpdate != null ? dateFormat.format(lastUpdate!) : null;
    return MyDeviceModel(
        id: id ?? '',
        name: name,
        locate: locate,
        serialNumber: serialNumber,
        type: type,
        balance: balanceString,
        status: status,
        lastUpdate: lasUpdateString);
  }
}
