import 'package:injectable/injectable.dart';
import 'package:radio_life/core/data/data_sources/exams/remote/exams_remote_data_source.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/entities/exam/exam_entity.dart';
import 'package:radio_life/core/domain/repositories/exams_repository.dart';
import 'package:radio_life/graphql/graphql_api.dart';
import '../../adapter/exams/exams_extension.dart';

@Injectable(as: ExamsRepository)
class ExamsRepositoryImplementation extends ExamsRepository {
  final ExamsRemoteDataSource _remoteDataSource;

  ExamsRepositoryImplementation(this._remoteDataSource);

  @override
  Future<Resource<List<ExamEntity>>> getExams({required String device}) =>
      Resource.asFuture(
        () => _remoteDataSource.getExams(device: device),
        (data) => GetExams$Query.fromJson(data).toEntityList,
      );
}
