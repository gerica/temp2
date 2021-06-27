import 'package:radio_life/app/pages/my_devices/pages/my_device_detail/model/my_device_detail_model.dart';
import 'package:radio_life/app/pages/my_devices/pages/my_device_detail/params/my_device_detail_param.dart';

extension MyDeviceDetailParamExtension on MyDeviceDetailParam {
  MyDeviceDetailModel get toModel => MyDeviceDetailModel(deviceName: deviceName);
}
