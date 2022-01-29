import 'package:radio_life/app/widget/dialog/reports_filter_dialog_widget.dart';
import 'package:radio_life/core/domain/entities/device/device_entity.dart';

class ReportFilter {
  int page;
  int perPage;
  MyDeviceEntity? device;
  ItemResultTest? resultTest;
  DateTime? startDate;
  DateTime? endDate;

  ReportFilter({
    required this.page,
    required this.perPage,
  });

  bool get haveFilter {
    return device != null || resultTest != null || (startDate != null && endDate != null);
  }
}
