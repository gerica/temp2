import 'package:radio_life/core/domain/entities/auth/auth_entity.dart';

import '../../../../graphql/graphql_api.dart';

extension SignIn$Mutation$UserExtension on SignIn$Mutation$User {
  AuthEntity toAuthEntity() => AuthEntity(
      accountId: $id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      token: token,
      confirmed: confirmed);
}

extension ChangePassword$Mutation$UserExtension
    on ChangePassword$Mutation$User {
  AuthEntity toAuthEntity() => AuthEntity(token: token, confirmed: confirmed);
}
