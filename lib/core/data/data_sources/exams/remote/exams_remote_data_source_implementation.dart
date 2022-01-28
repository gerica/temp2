import 'package:graphql/client.dart';
import 'package:injectable/injectable.dart';
import 'package:radio_life/core/data/data_sources/exams/remote/exams_remote_data_source.dart';
import 'package:radio_life/core/data/data_sources/exams/remote/get_exams_graph_query.dart';
import 'package:radio_life/core/domain/use_cases/exams/get_exams_use_case.dart';

@Injectable(as: ExamsRemoteDataSource)
class ExamsRemoteDataSourceImplementation extends ExamsRemoteDataSource {
  final GraphQLClient _graphQLClient;

  ExamsRemoteDataSourceImplementation(this._graphQLClient);

  @override
  Future<QueryResult> getExams({required FilterParams filter}) {
    final query = GetExamsGraphQuery(filter: filter);
    return _graphQLClient.query(
      QueryOptions(
        document: query.document,
        variables: query.variables,
      ),
    );
  }
}
