import 'package:get/get.dart';
import 'package:radio_life/core/domain/use_cases/my_devices/get_my_devices_use_case.dart';

class MyDevicesController extends GetxController {
  MyDevicesController(this._getMyDevicesUseCase);

  //region UseCase
  final GetMyDevicesUseCase _getMyDevicesUseCase;

  //endregion

  //region Variables
  final devices = [
    'Lorem ipsum',
    'Lorem ipsum',
    'Lorem ipsum',
    'Lorem ipsum',
    'Lorem ipsum',
    'Lorem ipsum',
    'Lorem ipsum',
  ];
//endregion

//region Functions
//endregion

}
