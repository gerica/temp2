import 'package:radio_life/core/domain/entities/user/user_entity.dart';

import '../../../../../graphql/graphql_api.graphql.dart';

extension GetUser$Query$UserExtension on GetUser$Query$User {
  UserEntity get toEntity => UserEntity(
      id: $id ?? '',
      firstName: firstName,
      lastName: lastName,
      email: email,
      image: image);
}

extension UpdateUser$Mutation$UpdateByIdUserPayload$Extension
    on UpdateUser$Mutation$UpdateByIdUserPayload {
  UserEntity get toEntity => UserEntity(
      id: '',
      firstName: record?.firstName ?? '',
      lastName: record?.lastName ?? '',
      email: record?.email ?? '',
      image: record?.image ?? '');
}
