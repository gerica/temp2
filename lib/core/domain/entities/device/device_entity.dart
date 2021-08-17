class DeviceEntity {
  final String? id;
  final String name;
  final String locate;
  final String serialNumber;
  final String type;
  final double balance;
  final String status;
  final DateTime lastUpdate;

  DeviceEntity({
    required this.name,
    required this.locate,
    required this.serialNumber,
    required this.type,
    required this.balance,
    required this.status,
    required this.lastUpdate,
    this.id,
  });
}
