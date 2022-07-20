class UserEntity {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? image;

  UserEntity({required this.id, required this.firstName, required this.lastName, this.email, this.image});

  UserEntity.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['_id'] == null ? null : parsedJson['_id'] as String;
    firstName = parsedJson['firstName'] == null ? null : parsedJson['firstName'] as String;
    lastName = parsedJson['lastName'] == null ? null : parsedJson['lastName'] as String;
    email = parsedJson['email'] == null ? null : parsedJson['email'] as String;
    image = parsedJson['image'] == null ? null : parsedJson['image'] as String;
  }

  String get firstNameStr => firstName ?? '';

  String get lastNameStr => lastName ?? '';

  String get idStr => id ?? '';
}
