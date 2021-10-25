// ignore_for_file: avoid_unused_constructor_parameters
class DeviceCheckRegister {
  late bool canUse;
  String? status;
  late String description;

  DeviceCheckRegister({required this.canUse, required this.status, required this.description});

  DeviceCheckRegister.fromJson(Map<String, dynamic> data) {
    final Map<String, dynamic> parsedJson = data['deviceCheckRegister'];
    canUse = parsedJson['canUse'] as bool;
    final tempStatus = parsedJson['status'];
    if (tempStatus != null) {
      status = tempStatus;
    }
    description = parsedJson['description'] as String;
  }
}
