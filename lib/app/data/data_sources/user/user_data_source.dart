import 'package:graphql/client.dart';
import 'package:radio_life/app/data/data_sources/datasource_base.dart';
import 'package:radio_life/app/data/data_sources/user/graphql/update_user_password_mutation.dart';
import 'package:radio_life/app/data/data_sources/user/graphql/user_by_id_query.dart';
import 'package:radio_life/app/data/data_sources/user/graphql/user_update_mutation.dart';
import 'package:radio_life/app/domain/entities/user/user_entity.dart';
import 'package:radio_life/app/domain/entities/user/user_entity_password.dart';

class UserDataSource extends DataSourceBase {
  UserDataSource() : super();

  @override
  Future<QueryResult> getUser({required String id}) {
    final query = UserByIdQuery(id: id);
    return graphQLClient.query(
      QueryOptions(
        document: query.document,
        variables: query.variables,
      ),
    );
  }

  @override
  Future<QueryResult> updateUserProfile({required UserEntity user}) {
    final mutation = UserUpdateMutation(
      id: user.idStr,
      firstName: user.firstNameStr,
      lastName: user.lastNameStr,
      image: user.image,
    );
    return graphQLClient.mutate(
      MutationOptions(
        document: mutation.document,
        variables: mutation.variables,
      ),
    );
  }

  @override
  Future<QueryResult> updateUserPassword({required UserEntityPassword user}) {
    final mutation = UpdateUserPasswordMutation(entity: user);
    return graphQLClient.mutate(
      MutationOptions(
        document: mutation.document,
        variables: mutation.variables,
      ),
    );
  }
}
