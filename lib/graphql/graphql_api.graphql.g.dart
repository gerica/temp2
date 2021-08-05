// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'graphql_api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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

UpdateUser$Mutation$UpdateByIdUserPayload$ErrorInterface
    _$UpdateUser$Mutation$UpdateByIdUserPayload$ErrorInterfaceFromJson(
        Map<String, dynamic> json) {
  return UpdateUser$Mutation$UpdateByIdUserPayload$ErrorInterface()
    ..message = json['message'] as String?;
}

Map<String,
    dynamic> _$UpdateUser$Mutation$UpdateByIdUserPayload$ErrorInterfaceToJson(
        UpdateUser$Mutation$UpdateByIdUserPayload$ErrorInterface instance) =>
    <String, dynamic>{
      'message': instance.message,
    };

UpdateUser$Mutation$UpdateByIdUserPayload$User
    _$UpdateUser$Mutation$UpdateByIdUserPayload$UserFromJson(
        Map<String, dynamic> json) {
  return UpdateUser$Mutation$UpdateByIdUserPayload$User()
    ..firstName = json['firstName'] as String
    ..lastName = json['lastName'] as String
    ..image = json['image'] as String?
    ..email = json['email'] as String;
}

Map<String, dynamic> _$UpdateUser$Mutation$UpdateByIdUserPayload$UserToJson(
        UpdateUser$Mutation$UpdateByIdUserPayload$User instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'image': instance.image,
      'email': instance.email,
    };

UpdateUser$Mutation$UpdateByIdUserPayload
    _$UpdateUser$Mutation$UpdateByIdUserPayloadFromJson(
        Map<String, dynamic> json) {
  return UpdateUser$Mutation$UpdateByIdUserPayload()
    ..error = json['error'] == null
        ? null
        : UpdateUser$Mutation$UpdateByIdUserPayload$ErrorInterface.fromJson(
            json['error'] as Map<String, dynamic>)
    ..record = json['record'] == null
        ? null
        : UpdateUser$Mutation$UpdateByIdUserPayload$User.fromJson(
            json['record'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UpdateUser$Mutation$UpdateByIdUserPayloadToJson(
        UpdateUser$Mutation$UpdateByIdUserPayload instance) =>
    <String, dynamic>{
      'error': instance.error?.toJson(),
      'record': instance.record?.toJson(),
    };

UpdateUser$Mutation _$UpdateUser$MutationFromJson(Map<String, dynamic> json) {
  return UpdateUser$Mutation()
    ..userUpdateById = json['userUpdateById'] == null
        ? null
        : UpdateUser$Mutation$UpdateByIdUserPayload.fromJson(
            json['userUpdateById'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UpdateUser$MutationToJson(
        UpdateUser$Mutation instance) =>
    <String, dynamic>{
      'userUpdateById': instance.userUpdateById?.toJson(),
    };

GetUser$Query$User _$GetUser$Query$UserFromJson(Map<String, dynamic> json) {
  return GetUser$Query$User()
    ..$id = json['_id'] as String
    ..firstName = json['firstName'] as String
    ..lastName = json['lastName'] as String
    ..email = json['email'] as String
    ..image = json['image'] as String?
    ..confirmed = json['confirmed'] as bool?;
}

Map<String, dynamic> _$GetUser$Query$UserToJson(GetUser$Query$User instance) =>
    <String, dynamic>{
      '_id': instance.$id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'image': instance.image,
      'confirmed': instance.confirmed,
    };

GetUser$Query _$GetUser$QueryFromJson(Map<String, dynamic> json) {
  return GetUser$Query()
    ..userById = json['userById'] == null
        ? null
        : GetUser$Query$User.fromJson(json['userById'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetUser$QueryToJson(GetUser$Query instance) =>
    <String, dynamic>{
      'userById': instance.userById?.toJson(),
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

UpdateUserArguments _$UpdateUserArgumentsFromJson(Map<String, dynamic> json) {
  return UpdateUserArguments(
    userId: json['userId'] as String,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    image: json['image'] as String,
  );
}

Map<String, dynamic> _$UpdateUserArgumentsToJson(
        UpdateUserArguments instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'image': instance.image,
    };

GetUserArguments _$GetUserArgumentsFromJson(Map<String, dynamic> json) {
  return GetUserArguments(
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$GetUserArgumentsToJson(GetUserArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
