class ExamEntity {
  final String? id;
  final DateTime date;
  final String examNumber;
  final String result;
  final String locate;

  const ExamEntity({
    required this.date,
    required this.examNumber,
    required this.result,
    required this.locate,
    this.id,
  });
}