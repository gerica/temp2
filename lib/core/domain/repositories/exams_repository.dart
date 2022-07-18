import 'package:radio_life/app/pages/my_devices/model/report_filter_model.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/entities/exam/exam_entity_list.dart';

abstract class ExamsRepository {
  Future<Resource<ExamEntityList>> getExams({required ReportFilter filter});
}
