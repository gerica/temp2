import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/entities/user/user_entity.dart';

abstract class UserRepository {
  Future<Resource<UserEntity?>> getUser({required String id});

  Future<Resource<String>> getUserId();

  Future<Resource<dynamic>> updateUserProfile({required UserEntity user});

  Future<void> saveUserId({required String id});
}