import 'package:injectable/injectable.dart';
import 'package:radio_life/core/data/adapter/user/user_extension.dart';
import 'package:radio_life/core/data/data_sources/user/remote/user_remote_data_source.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/entities/user/user_entity.dart';
import 'package:radio_life/core/domain/repositories/user/user_repository.dart';
import '../../../../../graphql/graphql_api.graphql.dart';

@Injectable(as: UserRepository)
class UserRepositoryImplementation extends UserRepository {
  final UserRemoteDataSource _remoteDataSource;

  UserRepositoryImplementation(this._remoteDataSource);

  @override
  Future<Resource<UserEntity>> getUser({required String id}) =>
      Resource.asFuture(
        () => _remoteDataSource.getUser(id: id),
        (data) => GetUser$Query$User.fromJson(data).toEntity,
      );
}
