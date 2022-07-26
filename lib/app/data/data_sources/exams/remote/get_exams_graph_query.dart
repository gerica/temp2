// ignore_for_file: join_return_with_assignment
import 'package:gql/ast.dart';
import 'package:graphql/client.dart';
import 'package:radio_life/app/pages/my_devices/model/report_filter_model.dart';

class GetExamsGraphQuery {
  final ReportFilter filter;

  GetExamsGraphQuery({required this.filter});

  Map<String, dynamic> get variables {
    final variables = {
      'perPage': filter.perPage,
      'page': filter.page,
      'deviceId': filter.device?.id,
      'result': filter.resultTest?.value,
      'startDate': filter.startDate?.toIso8601String(),
      'endDate': filter.endDate?.toIso8601String()
    };

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
    String filterHeader = '';
    String filterBody = 'filter:{';
    if (filter.device != null) {
      filterHeader += '\$deviceId: MongoID!,';
      filterBody += 'deviceId:\$deviceId, ';
    }
    if (filter.resultTest != null) {
      filterHeader += '\$result: String!,';
      filterBody += 'result:\$result, ';
    }
    if (filter.startDate != null && filter.endDate != null) {
      filterHeader += '\$startDate: Date!, \$ endDate: Date!,';
      filterBody += 'AND: [ '
          '{_operators: {createdAt: {gte: \$startDate}}},'
          '{_operators: {createdAt: {lte: \$endDate}}},'
          ']';
    }

    filterBody += '}';

    return 'query ExamResultPagination(\$perPage: Int!, \$page: Int!, $filterHeader) {'
        ' examResultPagination(sort: CREATEDAT_DESC, perPage:\$perPage, page:\$page, $filterBody ) {';
  }

  String _queryWithOutFilter() {
    return r'''query ExamResultPagination($perPage: Int!, $page: Int!) {
               examResultPagination(sort: CREATEDAT_DESC, perPage:$perPage, page:$page) {''';
  }

  DocumentNode get document {
    var initQuery = _queryWithOutFilter();
    if (filter.haveFilter) {
      initQuery = _queryWithFilter();
    }
    final query = initQuery + _getParameters() + r'}}';
    return gql(query);
  }
}
