// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'graphql_api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignIn$Mutation$User _$SignIn$Mutation$UserFromJson(Map<String, dynamic> json) {
  return SignIn$Mutation$User()
    ..$id = json['_id'] as String
    ..token = json['token'] as String?
    ..firstName = json['firstName'] as String
    ..lastName = json['lastName'] as String
    ..email = json['email'] as String
    ..confirmed = json['confirmed'] as bool?;
}

Map<String, dynamic> _$SignIn$Mutation$UserToJson(
        SignIn$Mutation$User instance) =>
    <String, dynamic>{
      '_id': instance.$id,
      'token': instance.token,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'confirmed': instance.confirmed,
    };

SignIn$Mutation _$SignIn$MutationFromJson(Map<String, dynamic> json) {
  return SignIn$Mutation()
    ..userLogin = json['userLogin'] == null
        ? null
        : SignIn$Mutation$User.fromJson(
            json['userLogin'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SignIn$MutationToJson(SignIn$Mutation instance) =>
    <String, dynamic>{
      'userLogin': instance.userLogin?.toJson(),
    };

SignUp$Mutation _$SignUp$MutationFromJson(Map<String, dynamic> json) {
  return SignUp$Mutation()..userRegister = json['userRegister'] as String?;
}

Map<String, dynamic> _$SignUp$MutationToJson(SignUp$Mutation instance) =>
    <String, dynamic>{
      'userRegister': instance.userRegister,
    };

ChangePassword$Mutation$User _$ChangePassword$Mutation$UserFromJson(
    Map<String, dynamic> json) {
  return ChangePassword$Mutation$User()
    ..$id = json['_id'] as String
    ..token = json['token'] as String?
    ..firstName = json['firstName'] as String
    ..lastName = json['lastName'] as String
    ..email = json['email'] as String
    ..confirmed = json['confirmed'] as bool?;
}

Map<String, dynamic> _$ChangePassword$Mutation$UserToJson(
        ChangePassword$Mutation$User instance) =>
    <String, dynamic>{
      '_id': instance.$id,
      'token': instance.token,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'confirmed': instance.confirmed,
    };

ChangePassword$Mutation _$ChangePassword$MutationFromJson(
    Map<String, dynamic> json) {
  return ChangePassword$Mutation()
    ..userChangePassword = json['userChangePassword'] == null
        ? null
        : ChangePassword$Mutation$User.fromJson(
            json['userChangePassword'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ChangePassword$MutationToJson(
        ChangePassword$Mutation instance) =>
    <String, dynamic>{
      'userChangePassword': instance.userChangePassword?.toJson(),
    };

SignInArguments _$SignInArgumentsFromJson(Map<String, dynamic> json) {
  return SignInArguments(
    email: json['email'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$SignInArgumentsToJson(SignInArguments instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

SignUpArguments _$SignUpArgumentsFromJson(Map<String, dynamic> json) {
  return SignUpArguments(
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    email: json['email'] as String,
  );
}

Map<String, dynamic> _$SignUpArgumentsToJson(SignUpArguments instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
    };

ChangePasswordArguments _$ChangePasswordArgumentsFromJson(
    Map<String, dynamic> json) {
  return ChangePasswordArguments(
    currentPassword: json['currentPassword'] as String,
    newPassword: json['newPassword'] as String,
  );
}

Map<String, dynamic> _$ChangePasswordArgumentsToJson(
        ChangePasswordArguments instance) =>
    <String, dynamic>{
      'currentPassword': instance.currentPassword,
      'newPassword': instance.newPassword,
    };
