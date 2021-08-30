import 'package:graphql/client.dart';

abstract class ExamsRemoteDataSource {
  Future<QueryResult> getExams({required String device});
}
