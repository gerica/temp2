import 'package:flutter_blue/flutter_blue.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:universal_io/io.dart';

@module
abstract class DeviceModule {
  @Named('language')
  String get language => Platform.localeName;

  FlutterBlue get flutterBlue => FlutterBlue.instance;

  ImagePicker get picker => ImagePicker();
}
