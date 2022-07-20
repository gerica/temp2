// ignore_for_file: join_return_with_assignment
import 'package:gql/ast.dart';
import 'package:graphql/client.dart';
import 'package:radio_life/core/domain/entities/user/user_entity_password.dart';

class UpdateUserPasswordMutation {
  UserEntityPassword entity;
  late DocumentNode _document;
  late Map<String, dynamic> _variables;

  UpdateUserPasswordMutation({required this.entity});

  Map<String, dynamic> get variables {
    _variables = {
      'oldPassword': entity.oldPassword,
      'newPassword': entity.newPassword,
    };
    return _variables;
  }

  DocumentNode get document {
    _document = gql(r'''
         mutation UserChangePassword($oldPassword: String!, $newPassword: String!) {
             userChangePassword(record:{oldPassword:$oldPassword, newPassword:$newPassword})       
         }
      ''');
    return _document;
  }
}
