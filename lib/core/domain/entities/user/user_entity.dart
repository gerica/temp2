class UserEntity {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String? image;

  UserEntity(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      this.image});
}
