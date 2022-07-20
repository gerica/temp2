import 'package:graphql/client.dart';
import 'package:radio_life/app/pages/my_devices/model/report_filter_model.dart';
import 'package:radio_life/core/data/data_sources/datasource_base.dart';
import 'package:radio_life/core/data/data_sources/exams/remote/get_exams_graph_query.dart';

class ExamsDataSource extends DataSourceBase {
  ExamsDataSource() : super();

  @override
  Future<QueryResult> getExams({required ReportFilter filter}) {
    final query = GetExamsGraphQuery(filter: filter);
    return graphQLClient.query(
      QueryOptions(
        variables: query.variables,
        document: query.document,
      ),
    );
  }
}
