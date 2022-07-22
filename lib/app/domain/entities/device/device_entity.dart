import 'package:radio_life/app/domain/base.dart';

class MyDeviceEntity extends Base {
  String? id;
  String? name;
  String? locate;
  String? serialNumber;
  String? type;
  int? balance;
  String? status;
  DateTime? lastUpdate;

  MyDeviceEntity({
    required this.name,
    required this.locate,
    required this.serialNumber,
    required this.type,
    required this.balance,
    required this.status,
    required this.lastUpdate,
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
    status = parsedJson['status'] == null ? null : parsedJson['status'] as String;
    type = parsedJson['type'] == null ? null : parsedJson['type'] as String;
    lastUpdate = parsedJson['lastUpdate'] == null ? null : DateTime.parse(parsedJson['lastUpdate']).toLocal();
    final account = parsedJson['account'];
    if (account != null) {
      balance = account['balance'] == null ? null : account['balance'] as int;
    } else {
      balance = parsedJson['balance'] == null ? null : parsedJson['balance'] as int;
    }
  }

  String? get lastStatus {
    if (_diffInMinutes() > 5) {
      return 'offline';
    }
    return status;
  }

  int _diffInMinutes() {
    if (lastUpdate == null) {
      return -1;
    }
    final Duration diff = DateTime.now().difference(lastUpdate!);

    // print(diff.inDays);
    // print(diff.inHours);
    // print(diff.inMinutes);
    // print(diff.inSeconds);
    // print('--------------final');
    return diff.inMinutes;
  }

  // MyDeviceEntity copyWith({
  //   String? id,
  //   String? name,
  //   String? locate,
  //   String? serialNumber,
  //   String? type,
  //   int? balance,
  //   String? status,
  // }) =>
  //     MyDeviceEntity(
  //       id: id ?? this.id,
  //       name: name ?? this.name,
  //       locate: locate ?? this.locate,
  //       serialNumber: serialNumber ?? this.serialNumber,
  //       type: type ?? this.type,
  //       balance: balance ?? this.balance,
  //       status: status ?? this.status,
  //     );
}
