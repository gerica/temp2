class PlanEntity {
  String? id;
  String? name;
  double? credit;
  double? value;

  PlanEntity({
    required this.id,
    required this.name,
    required this.credit,
    required this.value,
  });

  PlanEntity.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['_id'] == null ? null : parsedJson['_id'] as String;
    name = parsedJson['name'] == null ? null : parsedJson['name'] as String;
    credit = parsedJson['credit'] == null ? null : parsedJson['credit'] as double;
    value = parsedJson['value'] == null ? null : parsedJson['value'] as double;
  }
}
