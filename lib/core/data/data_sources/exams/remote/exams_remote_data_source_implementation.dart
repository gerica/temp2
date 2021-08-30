import 'package:graphql/client.dart';
import 'package:injectable/injectable.dart';
import 'package:radio_life/core/data/data_sources/exams/remote/exams_remote_data_source.dart';
import 'package:radio_life/graphql/graphql_api.graphql.dart';

@Injectable(as: ExamsRemoteDataSource)
class ExamsRemoteDataSourceImplementation extends ExamsRemoteDataSource {
  final GraphQLClient _graphQLClient;

  ExamsRemoteDataSourceImplementation(this._graphQLClient);

  @override
  Future<QueryResult> getExams({required String device}) {
    final query = GetExamsQuery();
    return _graphQLClient.query(
      QueryOptions(
        document: query.document
      ),
    );
  }
}
