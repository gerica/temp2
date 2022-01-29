import 'package:graphql/client.dart';
import 'package:radio_life/app/pages/my_devices/model/report_filter_model.dart';

abstract class ExamsRemoteDataSource {
  Future<QueryResult> getExams({required ReportFilter filter});
}
