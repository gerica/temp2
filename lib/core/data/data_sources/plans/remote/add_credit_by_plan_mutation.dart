import 'package:gql/ast.dart';
import 'package:graphql/client.dart';
import 'package:radio_life/core/data/data_sources/graphql_base.dart';

class AddCreditByPlanMutation extends GraphqlBase {
  final String idDevice;
  final String idPlan;

  AddCreditByPlanMutation({required this.idDevice, required this.idPlan});

  Map<String, dynamic> get variables {
    return {
      'idDevice': idDevice,
      'idPlan': idPlan,
    };
  }

  DocumentNode get document {
    return gql(r'''
         mutation DeviceAddCreditByPlan($idDevice: MongoID!, $idPlan: MongoID!) {
             deviceAddCreditByPlan(idDevice:$idDevice, idPlan:$idPlan){
              balance
            }        
         }
      ''');
  }
}
