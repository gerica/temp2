import 'package:gql/ast.dart';
import 'package:graphql/client.dart';
import 'package:radio_life/app/data/data_sources/graphql_base.dart';

class GetMyDevicesQuery extends GraphqlBase {
  GetMyDevicesQuery();

  Map<String, dynamic> get variables {
    return {};
  }

  DocumentNode get document {
    return gql(r'''
         query MyDevice() {
              myDevice {
              balance
              device
              locate
              name
              serialNumber
              status
              type
            }       
         }
      ''');
  }
}
