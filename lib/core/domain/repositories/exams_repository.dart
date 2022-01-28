import 'package:radio_life/core/data/adapter/exams/exams_extension.dart';
import 'package:radio_life/core/data/model/resource.dart';

import '../use_cases/exams/get_exams_use_case.dart';

abstract class ExamsRepository {
  Future<Resource<GetExams$Query$Extension>> getExams({required FilterParams filter});
}
