// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'graphql_api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignDevicePlan$Mutation$DeviceAddCreditPlanResult
    _$SignDevicePlan$Mutation$DeviceAddCreditPlanResultFromJson(
        Map<String, dynamic> json) {
  return SignDevicePlan$Mutation$DeviceAddCreditPlanResult()
    ..balance = json['balance'] as int?
    ..device = json['device'] as String?;
}

Map<String, dynamic> _$SignDevicePlan$Mutation$DeviceAddCreditPlanResultToJson(
        SignDevicePlan$Mutation$DeviceAddCreditPlanResult instance) =>
    <String, dynamic>{
      'balance': instance.balance,
      'device': instance.device,
    };

SignDevicePlan$Mutation _$SignDevicePlan$MutationFromJson(
    Map<String, dynamic> json) {
  return SignDevicePlan$Mutation()
    ..deviceAddCreditByPlan = json['deviceAddCreditByPlan'] == null
        ? null
        : SignDevicePlan$Mutation$DeviceAddCreditPlanResult.fromJson(
            json['deviceAddCreditByPlan'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SignDevicePlan$MutationToJson(
        SignDevicePlan$Mutation instance) =>
    <String, dynamic>{
      'deviceAddCreditByPlan': instance.deviceAddCreditByPlan?.toJson(),
    };

GetPlans$Query$PlanCredit _$GetPlans$Query$PlanCreditFromJson(
    Map<String, dynamic> json) {
  return GetPlans$Query$PlanCredit()
    ..$id = json['_id'] as String
    ..name = json['name'] as String
    ..value = (json['value'] as num).toDouble()
    ..credit = (json['credit'] as num).toDouble();
}

Map<String, dynamic> _$GetPlans$Query$PlanCreditToJson(
        GetPlans$Query$PlanCredit instance) =>
    <String, dynamic>{
      '_id': instance.$id,
      'name': instance.name,
      'value': instance.value,
      'credit': instance.credit,
    };

GetPlans$Query _$GetPlans$QueryFromJson(Map<String, dynamic> json) {
  return GetPlans$Query()
    ..planCreditGetAll = (json['planCreditGetAll'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : GetPlans$Query$PlanCredit.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$GetPlans$QueryToJson(GetPlans$Query instance) =>
    <String, dynamic>{
      'planCreditGetAll':
          instance.planCreditGetAll?.map((e) => e?.toJson()).toList(),
    };

ResetPassword$Mutation _$ResetPassword$MutationFromJson(
    Map<String, dynamic> json) {
  return ResetPassword$Mutation()
    ..userResetPassword = json['userResetPassword'] as String?;
}

Map<String, dynamic> _$ResetPassword$MutationToJson(
        ResetPassword$Mutation instance) =>
    <String, dynamic>{
      'userResetPassword': instance.userResetPassword,
    };

ChangePassword$Mutation _$ChangePassword$MutationFromJson(
    Map<String, dynamic> json) {
  return ChangePassword$Mutation()
    ..userChangePassword = json['userChangePassword'] as String?;
}

Map<String, dynamic> _$ChangePassword$MutationToJson(
        ChangePassword$Mutation instance) =>
    <String, dynamic>{
      'userChangePassword': instance.userChangePassword,
    };

SignIn$Mutation$UserLogin _$SignIn$Mutation$UserLoginFromJson(
    Map<String, dynamic> json) {
  return SignIn$Mutation$UserLogin()
    ..$id = json['_id'] as String
    ..token = json['token'] as String?
    ..firstName = json['firstName'] as String
    ..lastName = json['lastName'] as String
    ..email = json['email'] as String
    ..confirmed = json['confirmed'] as bool?;
}

Map<String, dynamic> _$SignIn$Mutation$UserLoginToJson(
        SignIn$Mutation$UserLogin instance) =>
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
        : SignIn$Mutation$UserLogin.fromJson(
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

GetExams$Query$ExamResult$Device _$GetExams$Query$ExamResult$DeviceFromJson(
    Map<String, dynamic> json) {
  return GetExams$Query$ExamResult$Device()
    ..locate = json['locate'] as String
    ..type = _$enumDecodeNullable(_$EnumDeviceTypeEnumMap, json['type'],
        unknownValue: EnumDeviceType.artemisUnknown);
}

Map<String, dynamic> _$GetExams$Query$ExamResult$DeviceToJson(
        GetExams$Query$ExamResult$Device instance) =>
    <String, dynamic>{
      'locate': instance.locate,
      'type': _$EnumDeviceTypeEnumMap[instance.type],
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$EnumDeviceTypeEnumMap = {
  EnumDeviceType.covid19: 'COVID19',
  EnumDeviceType.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

GetExams$Query$ExamResult _$GetExams$Query$ExamResultFromJson(
    Map<String, dynamic> json) {
  return GetExams$Query$ExamResult()
    ..date = json['date'] as String?
    ..examNumber = json['examNumber'] as String
    ..result = json['result'] as String
    ..deviceId = json['deviceId'] as String?
    ..serialNumber = json['serialNumber'] as String
    ..phase = json['phase'] as String?
    ..device = json['device'] == null
        ? null
        : GetExams$Query$ExamResult$Device.fromJson(
            json['device'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetExams$Query$ExamResultToJson(
        GetExams$Query$ExamResult instance) =>
    <String, dynamic>{
      'date': instance.date,
      'examNumber': instance.examNumber,
      'result': instance.result,
      'deviceId': instance.deviceId,
      'serialNumber': instance.serialNumber,
      'phase': instance.phase,
      'device': instance.device?.toJson(),
    };

GetExams$Query _$GetExams$QueryFromJson(Map<String, dynamic> json) {
  return GetExams$Query()
    ..examResultMany = (json['examResultMany'] as List<dynamic>)
        .map((e) =>
            GetExams$Query$ExamResult.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$GetExams$QueryToJson(GetExams$Query instance) =>
    <String, dynamic>{
      'examResultMany': instance.examResultMany.map((e) => e.toJson()).toList(),
    };

GetExamsByDevice$Query$ExamResult$Device
    _$GetExamsByDevice$Query$ExamResult$DeviceFromJson(
        Map<String, dynamic> json) {
  return GetExamsByDevice$Query$ExamResult$Device()
    ..locate = json['locate'] as String
    ..type = _$enumDecodeNullable(_$EnumDeviceTypeEnumMap, json['type'],
        unknownValue: EnumDeviceType.artemisUnknown);
}

Map<String, dynamic> _$GetExamsByDevice$Query$ExamResult$DeviceToJson(
        GetExamsByDevice$Query$ExamResult$Device instance) =>
    <String, dynamic>{
      'locate': instance.locate,
      'type': _$EnumDeviceTypeEnumMap[instance.type],
    };

GetExamsByDevice$Query$ExamResult _$GetExamsByDevice$Query$ExamResultFromJson(
    Map<String, dynamic> json) {
  return GetExamsByDevice$Query$ExamResult()
    ..date = json['date'] as String?
    ..examNumber = json['examNumber'] as String
    ..result = json['result'] as String
    ..deviceId = json['deviceId'] as String?
    ..serialNumber = json['serialNumber'] as String
    ..phase = json['phase'] as String?
    ..device = json['device'] == null
        ? null
        : GetExamsByDevice$Query$ExamResult$Device.fromJson(
            json['device'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetExamsByDevice$Query$ExamResultToJson(
        GetExamsByDevice$Query$ExamResult instance) =>
    <String, dynamic>{
      'date': instance.date,
      'examNumber': instance.examNumber,
      'result': instance.result,
      'deviceId': instance.deviceId,
      'serialNumber': instance.serialNumber,
      'phase': instance.phase,
      'device': instance.device?.toJson(),
    };

GetExamsByDevice$Query _$GetExamsByDevice$QueryFromJson(
    Map<String, dynamic> json) {
  return GetExamsByDevice$Query()
    ..examResultMany = (json['examResultMany'] as List<dynamic>)
        .map((e) => GetExamsByDevice$Query$ExamResult.fromJson(
            e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$GetExamsByDevice$QueryToJson(
        GetExamsByDevice$Query instance) =>
    <String, dynamic>{
      'examResultMany': instance.examResultMany.map((e) => e.toJson()).toList(),
    };

GetMyDevices$Query$MyDevice _$GetMyDevices$Query$MyDeviceFromJson(
    Map<String, dynamic> json) {
  return GetMyDevices$Query$MyDevice()
    ..name = json['name'] as String?
    ..locate = json['locate'] as String?
    ..serialNumber = json['serialNumber'] as String?
    ..type = json['type'] as String?
    ..balance = json['balance'] as int?
    ..status = json['status'] as String?
    ..lastUpdate = json['lastUpdate'] == null
        ? null
        : DateTime.parse(json['lastUpdate'] as String)
    ..device = json['device'] as String?;
}

Map<String, dynamic> _$GetMyDevices$Query$MyDeviceToJson(
        GetMyDevices$Query$MyDevice instance) =>
    <String, dynamic>{
      'name': instance.name,
      'locate': instance.locate,
      'serialNumber': instance.serialNumber,
      'type': instance.type,
      'balance': instance.balance,
      'status': instance.status,
      'lastUpdate': instance.lastUpdate?.toIso8601String(),
      'device': instance.device,
    };

GetMyDevices$Query _$GetMyDevices$QueryFromJson(Map<String, dynamic> json) {
  return GetMyDevices$Query()
    ..myDevice = (json['myDevice'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : GetMyDevices$Query$MyDevice.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$GetMyDevices$QueryToJson(GetMyDevices$Query instance) =>
    <String, dynamic>{
      'myDevice': instance.myDevice?.map((e) => e?.toJson()).toList(),
    };

SignDevicePlanArguments _$SignDevicePlanArgumentsFromJson(
    Map<String, dynamic> json) {
  return SignDevicePlanArguments(
    idDevice: json['idDevice'] as String,
    idPlan: json['idPlan'] as String,
  );
}

Map<String, dynamic> _$SignDevicePlanArgumentsToJson(
        SignDevicePlanArguments instance) =>
    <String, dynamic>{
      'idDevice': instance.idDevice,
      'idPlan': instance.idPlan,
    };

ResetPasswordArguments _$ResetPasswordArgumentsFromJson(
    Map<String, dynamic> json) {
  return ResetPasswordArguments(
    email: json['email'] as String,
  );
}

Map<String, dynamic> _$ResetPasswordArgumentsToJson(
        ResetPasswordArguments instance) =>
    <String, dynamic>{
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
    image: json['image'] as String?,
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

GetExamsByDeviceArguments _$GetExamsByDeviceArgumentsFromJson(
    Map<String, dynamic> json) {
  return GetExamsByDeviceArguments(
    deviceId: json['deviceId'] as String,
  );
}

Map<String, dynamic> _$GetExamsByDeviceArgumentsToJson(
        GetExamsByDeviceArguments instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
    };
