import 'package:radio_life/app/pages/my_devices/model/my_device_model.dart';
import 'package:radio_life/app/widget/dialog/reports_filter_dialog_widget.dart';

class ReportFilter {
  int page;
  int perPage;
  MyDeviceModel? device;
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
