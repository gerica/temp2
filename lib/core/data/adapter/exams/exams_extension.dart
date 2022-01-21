import 'package:intl/intl.dart';
import 'package:radio_life/core/domain/entities/exam/exam_entity.dart';
import 'package:radio_life/graphql/graphql_api.dart';

extension GetExams$Query$Extension on GetExams$Query {
  List<ExamEntity> get toEntityList => examResultMany.map((exam) => exam.toEntity).toList();
}

extension GetExams$Query$ExamResult$Extension on GetExams$Query$ExamResult {
  ExamEntity get toEntity {
    final dateTime = DateFormat('dd/MM/yyyy:HH:mm:ss').parse(date ?? '');
    return ExamEntity(
      date: dateTime,
      examNumber: examNumber,
      result: result,
      locate: device?.locate ?? '',
      deviceId: deviceId,
    );
  }
}
