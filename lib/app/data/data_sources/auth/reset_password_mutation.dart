import 'package:gql/ast.dart';
import 'package:graphql/client.dart';
import 'package:radio_life/app/data/data_sources/graphql_base.dart';

class ResetPasswordMutation extends GraphqlBase {
  final String email;

  ResetPasswordMutation({required this.email});

  Map<String, dynamic> get variables {
    return {
      'email': email,
    };
  }

  DocumentNode get document {
    return gql(r'''
         mutation UserResetPassword($email: String!) {
            userResetPassword(email:$email)
         }
      ''');
  }
}
