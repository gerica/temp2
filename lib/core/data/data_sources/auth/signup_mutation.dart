import 'package:gql/ast.dart';
import 'package:graphql/client.dart';
import 'package:radio_life/core/data/data_sources/graphql_base.dart';

class SignUpMutation extends GraphqlBase {
  final String firstName;
  final String lastName;
  final String email;

  SignUpMutation({required this.firstName, required this.lastName, required this.email});

  Map<String, dynamic> get variables {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
    };
  }

  DocumentNode get document {
    return gql(r'''
         mutation UserRegister($firstName: String!, $lastName: String!, $email: String!) {
             userRegister(record:{firstName:$firstName, lastName:$lastName, email:$email})        
         }
      ''');
  }
}
