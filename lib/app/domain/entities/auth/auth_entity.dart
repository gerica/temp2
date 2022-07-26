class AuthEntity {
  String? token;
  String? email;
  String? accountId;
  String? firstName;
  String? lastName;
  bool? confirmed;

  AuthEntity({this.email, this.token, this.accountId, this.firstName, this.lastName, this.confirmed});

  AuthEntity.fromJson(Map<String, dynamic> mapJson) {
    final Map<String, dynamic> parsedJson = mapJson['userLogin'];

    token = parsedJson['token'] == null ? null : parsedJson['token'] as String;
    email = parsedJson['email'] == null ? null : parsedJson['email'] as String;
    accountId = parsedJson['_id'] == null ? null : parsedJson['_id'] as String;
    firstName = parsedJson['firstName'] == null ? null : parsedJson['firstName'] as String;
    lastName = parsedJson['lastName'] == null ? null : parsedJson['lastName'] as String;
    confirmed = parsedJson['confirmed'] == null ? null : parsedJson['confirmed'] as bool;
  }
}
