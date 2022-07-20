// ignore_for_file: join_return_with_assignment
import 'package:gql/ast.dart';
import 'package:graphql/client.dart';
import 'package:radio_life/core/domain/entities/device/device_entity.dart';

class ConfirmRegisterDeviceMutation {
  MyDeviceEntity entity;
  late DocumentNode _document;
  late Map<String, dynamic> _variables;

  ConfirmRegisterDeviceMutation({required this.entity});

  Map<String, dynamic> get variables {
    _variables = {
      'serialNumber': entity.serialNumber,
      'name': entity.name,
    };
    return _variables;
  }

  DocumentNode get document {
    _document = gql(r'''
         mutation DeviceRegister($serialNumber: String!, $name: String) {
             deviceRegister(record:{serialNumber:$serialNumber, name:$name})        
         }
      ''');
    return _document;
  }
}
