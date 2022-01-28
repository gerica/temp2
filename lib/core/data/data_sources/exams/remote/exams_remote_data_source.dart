import 'package:graphql/client.dart';
import 'package:radio_life/core/domain/use_cases/exams/get_exams_use_case.dart';

abstract class ExamsRemoteDataSource {
  Future<QueryResult> getExams({required FilterParams filter});
}
