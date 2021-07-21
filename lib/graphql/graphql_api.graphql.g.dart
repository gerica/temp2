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
    ..email = json['email'] as String;
}

Map<String, dynamic> _$SignIn$Mutation$UserToJson(
        SignIn$Mutation$User instance) =>
    <String, dynamic>{
      '_id': instance.$id,
      'token': instance.token,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
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
