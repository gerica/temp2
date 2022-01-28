import 'package:radio_life/core/domain/base.dart';

class MyDeviceEntity extends Base {
  String? id;
  String? name;
  String? locate;
  String? serialNumber;
  String? type;
  int? balance;
  String? status;

  MyDeviceEntity({
    required this.name,
    required this.locate,
    required this.serialNumber,
    required this.type,
    required this.balance,
    required this.status,
    this.id,
  });

  MyDeviceEntity.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['_id'] == null ? null : parsedJson['_id'] as String;
    deleted = parsedJson['deleted'] == null ? null : parsedJson['deleted'] as bool;
    createdAt = parsedJson['createdAt'] == null ? null : DateTime.parse(parsedJson['createdAt']).toLocal();
    updatedAt = parsedJson['updatedAt'] == null ? null : DateTime.parse(parsedJson['updatedAt']).toLocal();
    name = parsedJson['name'] == null ? null : parsedJson['name'] as String;
    locate = parsedJson['locate'] == null ? null : parsedJson['locate'] as String;
    serialNumber = parsedJson['serialNumber'] == null ? null : parsedJson['serialNumber'] as String;
    type = parsedJson['type'] == null ? null : parsedJson['type'] as String;
    final account = parsedJson['account'];
    if (account != null) {
      balance = account['balance'] == null ? null : account['balance'] as int;
    }
  }
}
