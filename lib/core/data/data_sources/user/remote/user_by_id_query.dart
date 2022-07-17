import 'package:gql/ast.dart';
import 'package:graphql/client.dart';
import 'package:radio_life/core/data/data_sources/graphql_base.dart';

class UserByIdQuery extends GraphqlBase {
  final String id;

  UserByIdQuery({required this.id});

  Map<String, dynamic> get variables {
    return {
      'id': id,
    };
  }

  DocumentNode get document {
    return gql(r'''
         query UserById($id: MongoID!) {
               userById(_id: $id) {
                _id
                firstName
                lastName
                email
                image
              }        
         }
      ''');
  }
}
