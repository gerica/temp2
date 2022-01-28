import 'package:radio_life/core/domain/entities/exam/exam_entity.dart';

class GetExams$Query$Extension {
  int? count;
  List<ExamEntity> items = [];

  GetExams$Query$Extension.fromJson(Map<String, dynamic> parsedJson) {
    count = parsedJson['count'] == null ? null : parsedJson['count'] as int;
    final exams = parsedJson['items'];
    items = [];
    if (exams != null && exams.length > 0) {
      for (final objJson in exams) {
        items.add(ExamEntity.fromJson(objJson));
      }
    }
  }
}

// class GetExams$Query$ExamResult$Extension on GetExams$Query$ExamResult {
//   ExamEntity get toEntity {
//     final dateTime = DateFormat('dd/MM/yyyy:HH:mm:ss').parse(date ?? '');
//     return ExamEntity(
//       date: dateTime,
//       examNumber: examNumber,
//       result: result,
//       locate: device?.locate ?? '',
//       deviceId: deviceId,
//     );
//   }
// }
