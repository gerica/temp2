import 'package:injectable/injectable.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/entities/exam/exam_entity.dart';
import 'package:radio_life/core/domain/repositories/exams_repository.dart';
import 'package:radio_life/core/domain/use_cases/base/base_use_case.dart';

@injectable
class GetExamsUseCase
    extends BaseFutureResourceUseCase<String, List<ExamEntity>> {
  final ExamsRepository _examsRepository;

  GetExamsUseCase(this._examsRepository);

  @override
  Future<Resource<List<ExamEntity>?>> call(String params) =>
      _examsRepository.getExams(device: params);
}
