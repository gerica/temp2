class AuthEntity {
  final String? token;
  final String? email;
  final String? accountId;
  final String? firstName;
  final String? lastName;
  final bool? confirmed;

  AuthEntity(
      {this.email,
      this.token,
      this.accountId,
      this.firstName,
      this.lastName,
      this.confirmed});
}
