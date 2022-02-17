import 'package:get/get.dart';
import 'package:radio_life/app/utils/try_cast.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/entities/exam/exam_entity.dart';

class ReportDetailsController extends GetxController {
  //region State
  Rx<Resource<ExamEntity>> state = Resource.loading<ExamEntity>().obs;

  @override
  void onInit() {
    super.onInit();
    final param = tryCast<ExamEntity>(Get.arguments);
    if (param != null) {
      state.value = Resource.success(data: param);
    }
  }

  bool get result {
    return state.value.data?.resultDesc == 'P';
  }
}
