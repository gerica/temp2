import 'package:radio_life/app/data/data_sources/exams/remote/exams_data_source.dart';
import 'package:radio_life/app/data/model/resource.dart';
import 'package:radio_life/app/domain/entities/exam/exam_entity_list.dart';
import 'package:radio_life/app/pages/my_devices/model/report_filter_model.dart';

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
