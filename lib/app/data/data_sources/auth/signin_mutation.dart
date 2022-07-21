import 'package:gql/ast.dart';
import 'package:graphql/client.dart';
import 'package:radio_life/app/data/data_sources/graphql_base.dart';

class SignInMutation extends GraphqlBase {
  final String email;
  final String password;

  SignInMutation({required this.email, required this.password});

  Map<String, dynamic> get variables {
    return {
      'email': email,
      'password': password,
    };
  }

  DocumentNode get document {
    return gql(r'''
         mutation UserLogin($email: String!, $password: String!) {
             userLogin(record:{email:$email, password:$password}){
                _id
                token
                confirmed
                email
                firstName
                lastName
                image
              }        
         }
      ''');
  }
}
