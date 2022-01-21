import 'package:intl/intl.dart';
import 'package:radio_life/app/pages/reports/model/report_model.dart';
import 'package:radio_life/app/pages/reports/pages/report_details/model/report_details_model.dart';
import 'package:radio_life/app/pages/reports/pages/report_details/params/report_details_params.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/core/domain/entities/exam/exam_entity.dart';

extension ReportDetailsParamsExtension on ReportDetailsParams {
  ReportDetailsModel get toReportDetailsModel => ReportDetailsModel(
        title: report,
        status: status,
      );
}

abstract class ReportsAdapter {
  static List<ReportModel> fromEntityList(List<ExamEntity> exams) => exams
      .map((exams) => ReportModel(
            examNumber: exams.examNumber,
            result: exams.result,
            locate: exams.locate,
            date: DateFormat('MM/dd/yyyy').format(exams.date),
            tagColor: AppColorScheme.success,
            deviceId: exams.deviceId,
          ))
      .toList();
}
