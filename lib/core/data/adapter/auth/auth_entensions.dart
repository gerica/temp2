import 'package:radio_life/core/domain/entities/auth/auth_entity.dart';

import '../../../../graphql/graphql_api.dart';

extension SignIn$Mutation$UserExtension on SignIn$Mutation$UserLogin {
  AuthEntity toAuthEntity() => AuthEntity(
      accountId: $id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      token: token,
      confirmed: confirmed);
}

extension ChangePassword$Mutation$UserExtension on ChangePassword$Mutation {
  AuthEntity toAuthEntity() =>
      AuthEntity(token: userChangePassword, confirmed: true);
}
