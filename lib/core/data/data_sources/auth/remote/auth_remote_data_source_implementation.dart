import 'package:graphql/client.dart';
import 'package:injectable/injectable.dart';
import 'package:radio_life/core/data/data_sources/auth/remote/change_password_mutation.dart';
import 'package:radio_life/core/data/data_sources/auth/remote/reset_password_mutation.dart';
import 'package:radio_life/core/data/data_sources/auth/remote/signin_mutation.dart';
import 'package:radio_life/core/data/data_sources/auth/remote/signup_mutation.dart';
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
      firstName: firstName,
      lastName: lastName,
      email: email,
    );
    return _graphQLClient.mutate(
      MutationOptions(
        document: mutation.document,
        variables: mutation.variables,
      ),
    );
  }

  @override
  Future<QueryResult> signIn({
    required String email,
    required String password,
  }) {
    final mutation = SignInMutation(
      email: email,
      password: password,
    );
    return _graphQLClient.mutate(
      MutationOptions(
        document: mutation.document,
        variables: mutation.variables,
      ),
    );
  }

  @override
  Future<QueryResult> changePassword({
    required String oldPassword,
    required String newPassword,
  }) {
    final mutation = ChangePasswordMutation(
      oldPassword: oldPassword,
      newPassword: newPassword,
    );
    return _graphQLClient.mutate(
      MutationOptions(
        document: mutation.document,
        variables: mutation.variables,
      ),
    );
  }

  @override
  Future<QueryResult> resetPassword({required String email}) {
    final mutation = ResetPasswordMutation(email: email);
    return _graphQLClient.mutate(
      MutationOptions(
        document: mutation.document,
        variables: mutation.variables,
      ),
    );
  }
}
