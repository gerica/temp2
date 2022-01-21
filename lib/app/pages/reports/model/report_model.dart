import 'dart:ui';

class ReportModel {
  final String? id;
  final String examNumber;
  final String result;
  final String date;
  final String locate;
  final Color tagColor;
  final String? deviceId;

  ReportModel({
    required this.examNumber,
    required this.result,
    required this.date,
    required this.tagColor,
    required this.locate,
    required this.deviceId,
    this.id,
  });
}
