import 'package:injectable/injectable.dart';
import 'package:radio_life/app/pages/my_devices/model/report_filter_model.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/entities/exam/exam_entity_list.dart';
import 'package:radio_life/core/domain/repositories/exams_repository.dart';
import 'package:radio_life/core/domain/use_cases/base/base_use_case.dart';

@injectable
class GetExamsUseCase extends BaseFutureResourceUseCase<ReportFilter, ExamEntityList> {
  final ExamsRepository _examsRepository;

  GetExamsUseCase(this._examsRepository);

  @override
  Future<Resource<ExamEntityList>> call(ReportFilter params) => _examsRepository.getExams(filter: params);
}
