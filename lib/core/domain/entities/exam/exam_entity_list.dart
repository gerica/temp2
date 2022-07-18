import 'package:radio_life/core/domain/entities/exam/exam_entity.dart';

class ExamEntityList {
  int? count;
  List<ExamEntity> items = [];

  ExamEntityList.fromJson(Map<String, dynamic> parsedJson) {
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
