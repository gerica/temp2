import 'package:injectable/injectable.dart';
import 'package:radio_life/core/data/data_sources/exams/remote/exams_remote_data_source.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/repositories/exams_repository.dart';
import 'package:radio_life/core/domain/use_cases/exams/get_exams_use_case.dart';
import '../../adapter/exams/exams_extension.dart';

@Injectable(as: ExamsRepository)
class ExamsRepositoryImplementation extends ExamsRepository {
  final ExamsRemoteDataSource _remoteDataSource;

  ExamsRepositoryImplementation(this._remoteDataSource);

  @override
  Future<Resource<GetExams$Query$Extension>> getExams({required FilterParams filter}) => Resource.asFuture(
        () => _remoteDataSource.getExams(filter: filter),
        (data) {
          final objJson = data['examResultPagination'];
          return GetExams$Query$Extension.fromJson(objJson);
        },
      );
}
