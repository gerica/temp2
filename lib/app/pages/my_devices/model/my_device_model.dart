class MyDeviceModel {
  final String id;
  final String? name;
  final String? locate;
  final String? serialNumber;
  final String? type;
  final String? balance;
  final String? status;
  final String? lastUpdate;

  MyDeviceModel({
    required this.id,
    required this.name,
    required this.locate,
    required this.serialNumber,
    required this.type,
    required this.balance,
    required this.status,
    required this.lastUpdate,
  });

  MyDeviceModel copyWith({
    String? id,
    String? name,
    String? locate,
    String? serialNumber,
    String? type,
    String? balance,
    String? status,
    String? lastUpdate,
  }) =>
      MyDeviceModel(
        id: id ?? this.id,
        name: name ?? this.name,
        locate: locate ?? this.locate,
        serialNumber: serialNumber ?? this.serialNumber,
        type: type ?? this.type,
        balance: balance ?? this.balance,
        status: status ?? this.status,
        lastUpdate: lastUpdate ?? this.lastUpdate,
      );
}
