import 'package:graphql/client.dart';
import 'package:injectable/injectable.dart';
import 'package:radio_life/app/pages/my_devices/model/report_filter_model.dart';
import 'package:radio_life/core/data/data_sources/exams/remote/exams_remote_data_source.dart';
import 'package:radio_life/core/data/data_sources/exams/remote/get_exams_graph_query.dart';

@Injectable(as: ExamsRemoteDataSource)
class ExamsRemoteDataSourceImplementation extends ExamsRemoteDataSource {
  final GraphQLClient _graphQLClient;

  ExamsRemoteDataSourceImplementation(this._graphQLClient);

  @override
  Future<QueryResult> getExams({required ReportFilter filter}) {
    final query = GetExamsGraphQuery(filter: filter);
    return _graphQLClient.query(
      QueryOptions(
        variables: query.variables,
        document: query.document,
      ),
    );
  }
}
