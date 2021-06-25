import 'package:graphql/client.dart';
import 'package:injectable/injectable.dart';
import 'package:radio_life/core/data/data_sources/remote/auth_remote_data_source.dart';

import '../../../../graphql/graphql_api.dart';

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
        password: ''
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
}
