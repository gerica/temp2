import 'dart:io';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DeviceModule {
  @Named('language')
  String get language => Platform.localeName;

  FlutterBlue get flutterBlue => FlutterBlue.instance;
}
