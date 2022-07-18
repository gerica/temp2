import 'package:gql/ast.dart';
import 'package:graphql/client.dart';
import 'package:radio_life/core/data/data_sources/graphql_base.dart';

class GetAllPlansQuery extends GraphqlBase {
  GetAllPlansQuery();

  Map<String, dynamic> get variables {
    return {};
  }

  DocumentNode get document {
    return gql(r'''
         query PlanCreditGetAll() {
            planCreditGetAll {
              name
              value
              credit
              active    
            }         
         }
      ''');
  }
}
