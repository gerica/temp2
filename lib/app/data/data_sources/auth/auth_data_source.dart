import 'package:graphql/client.dart';
import 'package:radio_life/app/data/data_sources/auth/change_password_mutation.dart';
import 'package:radio_life/app/data/data_sources/auth/reset_password_mutation.dart';
import 'package:radio_life/app/data/data_sources/auth/signin_mutation.dart';
import 'package:radio_life/app/data/data_sources/auth/signup_mutation.dart';
import 'package:radio_life/app/data/data_sources/datasource_base.dart';

class AuthDataSource extends DataSourceBase {
  AuthDataSource() : super();

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
    return graphQLClient.mutate(
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
    return graphQLClient.mutate(
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
    return graphQLClient.mutate(
      MutationOptions(
        document: mutation.document,
        variables: mutation.variables,
      ),
    );
  }

  @override
  Future<QueryResult> resetPassword({required String email}) {
    final mutation = ResetPasswordMutation(email: email);
    return graphQLClient.mutate(
      MutationOptions(
        document: mutation.document,
        variables: mutation.variables,
      ),
    );
  }
}
