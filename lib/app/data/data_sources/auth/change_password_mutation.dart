import 'package:gql/ast.dart';
import 'package:graphql/client.dart';
import 'package:radio_life/app/data/data_sources/graphql_base.dart';

class ChangePasswordMutation extends GraphqlBase {
  final String oldPassword;
  final String newPassword;

  ChangePasswordMutation({required this.oldPassword, required this.newPassword});

  Map<String, dynamic> get variables {
    return {
      'oldPassword': oldPassword,
      'newPassword': newPassword,
    };
  }

  DocumentNode get document {
    return gql(r'''
         mutation UserChangePassword($oldPassword: String!, $newPassword: String!) {
            userChangePassword(record:{oldPassword:$oldPassword, newPassword:$newPassword})                  
         }
      ''');
  }
}
