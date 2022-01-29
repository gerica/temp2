import 'package:radio_life/app/pages/my_devices/model/report_filter_model.dart';
import 'package:radio_life/core/data/adapter/exams/exams_extension.dart';
import 'package:radio_life/core/data/model/resource.dart';

abstract class ExamsRepository {
  Future<Resource<GetExams$Query$Extension>> getExams({required ReportFilter filter});
}
