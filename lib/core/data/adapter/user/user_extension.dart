import 'package:radio_life/core/domain/entities/user/user_entity.dart';

import '../../../../../graphql/graphql_api.graphql.dart';

extension GetUser$Query$UserExtension on GetUser$Query$User {
  UserEntity get toEntity => UserEntity(
        id: $id,
        firstName: firstName,
        lastName: lastName,
        email: email,
      );
}
