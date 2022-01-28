// ignore_for_file: join_return_with_assignment
import 'package:gql/ast.dart';
import 'package:graphql/client.dart';
import 'package:radio_life/core/domain/use_cases/exams/get_exams_use_case.dart';

class GetExamsGraphQuery {
  final FilterParams filter;

  GetExamsGraphQuery({required this.filter});

  Map<String, dynamic> get variables {
    final variables = {
      // 'sort': sort,
      'perPage': filter.perPage,
      'page': filter.page,
      'deviceId': filter.deviceId,
      'location': filter.location,
      'status': filter.status
    };
    // if (filter != null) {
    //   variables.addAll({"filter": filter});
    // }
    return variables;
  }

  String _getParameters() {
    return r'''count
              items {
                _id
                alarm
                battery      
                currentFrequency
                date      
                deviceId
                factoryFrequency
                freeMemory
                hall
                humidity
                mag
                phase
                plate
                reserve1
                reserve2
                reserve3
                tEnvironment
                tSample
                examNumber
                result
                createdAt
                deleted
                updatedAt
                device {   
                  _id
                  locate
                  name
                  type        
                  user
                  serialNumber
                  account {
                    _id
                    createdAt
                    deleted
                    updatedAt
                    balance          
                  }
                  createdAt
                  deleted
                  updatedAt
                  
                }
              }
            ''';
  }

  String _queryWithFilter() {
    return r'''query ExamResultPagination($perPage: Int!, $page: Int!) {
               examResultPagination(sort: CREATEDAT_DESC, perPage:$perPage, page:$page, filter:{deviceId:$deviceId}) {''';
  }

  String _queryWithOutFilter() {
    return r'''query ExamResultPagination($perPage: Int!, $page: Int!) {
               examResultPagination(sort: CREATEDAT_DESC, perPage:$perPage, page:$page) {''';
  }

  DocumentNode get document {
    var initQuery = _queryWithOutFilter();
    if (filter.deviceId != null) {
      initQuery = _queryWithFilter();
    }
    final query = initQuery + _getParameters() + r'}}';
    return gql(query);
  }
}
