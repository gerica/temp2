import 'package:get/get.dart';
import 'package:radio_life/app/pages/home/pages/reports/pages/report_details/params/report_details_params.dart';
import 'package:radio_life/app/utils/try_cast.dart';
import 'package:radio_life/core/data/model/resource.dart';

import '../../../../../../pages/adapter/index.dart';
import 'model/report_details_model.dart';

class ReportDetailsController extends GetxController {
  //region State
  Rx<Resource<ReportDetailsModel>> state = Resource.loading<ReportDetailsModel>().obs;
  //endregion

  //region Variables

  //endregion

  //region Functions
  @override
  void onInit() {
    super.onInit();
    final param = tryCast<ReportDetailsParams>(Get.arguments);
    if(param != null)
      state.value = Resource.success(data: param.toReportDetailsModel);
  }
  //endregion

}
