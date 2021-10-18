// ignore_for_file: join_return_with_assignment
import 'package:gql/ast.dart';
import 'package:graphql/client.dart';

class DeviceCheckRegisterQuery {
  String serialNumber;
  late DocumentNode _document;
  late Map<String, dynamic> _variables;

  DeviceCheckRegisterQuery({required this.serialNumber});

  Map<String, dynamic> get variables {
    _variables = {
      'serialNumber': serialNumber,
    };
    return _variables;
  }

  DocumentNode get document {
    _document = gql(r'''
         query DeviceCheckRegister($serialNumber: String!) {
          deviceCheckRegister(serialNumber:$serialNumber){
            canUse
            description
            status
          }          
         }
      ''');
    return _document;
  }
}
