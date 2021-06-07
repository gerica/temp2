import 'package:radio_life/app/pages/home/pages/reports/pages/report_details/model/report_details_model.dart';
import 'package:radio_life/app/pages/home/pages/reports/pages/report_details/params/report_details_params.dart';

extension ReportDetailsParamsExtension on ReportDetailsParams {
  ReportDetailsModel get toReportDetailsModel => ReportDetailsModel(
        title: report,
        status: status,
      );
}
