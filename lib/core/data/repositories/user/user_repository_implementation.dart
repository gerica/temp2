import 'package:injectable/injectable.dart';
import 'package:radio_life/core/data/data_sources/user/local/user_local_data_source.dart';
import 'package:radio_life/core/data/data_sources/user/remote/user_remote_data_source.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/entities/user/user_entity.dart';
import 'package:radio_life/core/domain/entities/user/user_entity_password.dart';
import 'package:radio_life/core/domain/repositories/user/user_repository.dart';

@Injectable(as: UserRepository)
class UserRepositoryImplementation extends UserRepository {
  final UserRemoteDataSource _remoteDataSource;
  final UserLocalDataSource _localDataSource;

  UserRepositoryImplementation(
    this._remoteDataSource,
    this._localDataSource,
  );

  @override
  Future<Resource<UserEntity?>> getUser({required String id}) => Resource.asFuture(
        () => _remoteDataSource.getUser(id: id),
        (data) => UserEntity.fromJson(data),
      );

  @override
  Future<Resource<String>> getUserId() => Resource.asFuture(
        () async => _localDataSource.getUserId,
        (data) => data,
      );

  @override
  Future<Resource> updateUserProfile({required UserEntity user}) => Resource.asFuture(
        () => _remoteDataSource.updateUserProfile(user: user),
        (data) => UserEntity.fromJson(data),
      );

  @override
  Future<void> saveUserId({required String id}) => _localDataSource.saveUserId(id);

  @override
  Future<Resource> updateUserPassword({required UserEntityPassword user}) {
    return Resource.asFuture(
      () => _remoteDataSource.updateUserPassword(user: user),
      (data) => data,
    );
  }
}
