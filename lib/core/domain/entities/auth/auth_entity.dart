class AuthEntity {
  final String? token;
  final String? email;
  final String? accountId;
  final String? firstName;
  final String? lastName;

  AuthEntity({
    this.email,
    this.token,
    this.accountId,
    this.firstName,
    this.lastName
  });
}
