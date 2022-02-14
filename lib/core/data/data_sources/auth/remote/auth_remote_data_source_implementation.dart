import 'package:graphql/client.dart';
import 'package:injectable/injectable.dart';

import 'package:radio_life/graphql/graphql_api.dart';
import 'auth_remote_data_source.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthDataSourceImplementation extends AuthRemoteDataSource {
  final GraphQLClient _graphQLClient;

  AuthDataSourceImplementation(this._graphQLClient);

  @override
  Future<QueryResult> signUp({
    required String firstName,
    required String lastName,
    required String email,
  }) {
    final mutation = SignUpMutation(
      variables: SignUpArguments(
        firstName: firstName,
        lastName: lastName,
        email: email,
      ),
    );
    return _graphQLClient.mutate(
      MutationOptions(
        document: mutation.document,
        variables: mutation.getVariablesMap(),
      ),
    );
  }

  @override
  Future<QueryResult> signIn({
    required String email,
    required String password,
  }) {
    final mutation = SignInMutation(
      variables: SignInArguments(email: email, password: password),
    );
    return _graphQLClient.mutate(
      MutationOptions(
        document: mutation.document,
        variables: mutation.getVariablesMap(),
      ),
    );
  }

  @override
  Future<QueryResult> changePassword({
    required String currentPassword,
    required String newPassword,
  }) {
    final mutation = ChangePasswordMutation(
      variables: ChangePasswordArguments(
        currentPassword: currentPassword,
        newPassword: newPassword,
      ),
    );
    return _graphQLClient.mutate(
      MutationOptions(
        document: mutation.document,
        variables: mutation.getVariablesMap(),
      ),
    );
  }

  @override
  Future<QueryResult> resetPassword({required String email}) {
    final mutation = ResetPasswordMutation(
      variables: ResetPasswordArguments(
        email: email,
      ),
    );
    return _graphQLClient.mutate(
      MutationOptions(
        document: mutation.document,
        variables: mutation.getVariablesMap(),
      ),
    );
  }
}
