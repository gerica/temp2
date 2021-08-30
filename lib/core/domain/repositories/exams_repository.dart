import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/entities/exam/exam_entity.dart';

abstract class ExamsRepository {
  Future<Resource<List<ExamEntity>>> getExams({required String device});
}
