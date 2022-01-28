import 'package:injectable/injectable.dart';
import 'package:radio_life/core/data/adapter/exams/exams_extension.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/repositories/exams_repository.dart';
import 'package:radio_life/core/domain/use_cases/base/base_use_case.dart';

class FilterParams {
  final int page;
  final int perPage;
  String? deviceId;
  String? location;
  String? status;

  FilterParams({
    required this.page,
    required this.perPage,
    this.deviceId,
    this.location,
    this.status,
  });
}

@injectable
class GetExamsUseCase extends BaseFutureResourceUseCase<FilterParams, GetExams$Query$Extension> {
  final ExamsRepository _examsRepository;

  GetExamsUseCase(this._examsRepository);

  @override
  Future<Resource<GetExams$Query$Extension>> call(FilterParams params) => _examsRepository.getExams(filter: params);
}
