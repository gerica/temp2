class ExamEntity {
  final String? id;
  final DateTime date;
  final String examNumber;
  final String result;

  const ExamEntity(
      {required this.date,
      required this.examNumber,
      required this.result,
      this.id});
}
