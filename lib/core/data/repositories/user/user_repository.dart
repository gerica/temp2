import 'dart:convert';

import 'package:radio_life/core/data/data_sources/user/user_data_source.dart';
import 'package:radio_life/core/data/data_sources/user/user_data_source_local.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/entities/user/user_entity.dart';
import 'package:radio_life/core/domain/entities/user/user_entity_password.dart';
import 'package:universal_io/io.dart';

class UserRepository {
  final _remoteDataSource = UserDataSource();
  final _localDataSource = UserDataSourceLocal();

  Future<Resource<UserEntity?>> getUser({required String id}) => Resource.asFuture(
        () => _remoteDataSource.getUser(id: id),
        (data) => UserEntity.fromJson(data),
      );

  Future<Resource<String>> getUserId() => Resource.asFuture(
        () async => _localDataSource.getUserId,
        (data) => data,
      );

  Future<Resource> updateUserProfile({required UserEntity user}) => Resource.asFuture(
        () => _remoteDataSource.updateUserProfile(user: user),
        (data) => UserEntity.fromJson(data),
      );

  Future<void> saveUserId({required String id}) => _localDataSource.saveUserId(id);

  Future<Resource> updateUserPassword({required UserEntityPassword user}) {
    return Resource.asFuture(
      () => _remoteDataSource.updateUserPassword(user: user),
      (data) => data,
    );
  }

  Future<String> convertoToBase64(File params) async {
    final List<int> imageBytes = await params.readAsBytes();
    final base64Image = base64Encode(imageBytes);
    return base64Image;
  }
}
