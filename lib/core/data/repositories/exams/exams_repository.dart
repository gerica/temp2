import 'package:radio_life/app/pages/my_devices/model/report_filter_model.dart';
import 'package:radio_life/core/data/data_sources/exams/remote/exams_data_source.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/entities/exam/exam_entity_list.dart';

class ExamsRepository {
  final _examsDataSource = ExamsDataSource();

  @override
  Future<Resource<ExamEntityList>> getExams({required ReportFilter filter}) => Resource.asFuture(
        () => _examsDataSource.getExams(filter: filter),
        (data) {
          final objJson = data['examResultPagination'];
          return ExamEntityList.fromJson(objJson);
        },
      );
}
