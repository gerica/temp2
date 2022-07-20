// ignore_for_file: join_return_with_assignment
import 'package:gql/ast.dart';
import 'package:graphql/client.dart';
import 'package:radio_life/app/data/data_sources/graphql_base.dart';

class DeviceCheckRegisterQuery extends GraphqlBase {
  String serialNumber;

  DeviceCheckRegisterQuery({required this.serialNumber});

  Map<String, dynamic> get variables {
    return {
      'serialNumber': serialNumber,
    };
  }

  DocumentNode get document {
    return gql(r'''
         query DeviceCheckRegister($serialNumber: String!) {
          deviceCheckRegister(serialNumber:$serialNumber){
            canUse
            description
            status
          }          
         }
      ''');
  }
}
