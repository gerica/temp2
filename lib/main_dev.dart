import 'dart:async';

import 'package:flutter/material.dart';
import 'package:radio_life/app/data/helpers/error_mapper.dart';
import 'package:radio_life/app/data/model/resource.dart';
import 'package:radio_life/app/data/util/app_http_override.dart';
import 'package:radio_life/app/radio_life_app_widget.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:universal_io/io.dart';

import 'flavors/environment.dart';
import 'flavors/flavor_values.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = AppHttpOverrides();
  runZonedGuarded(
    () async {
      Resource.setErrorMapper(ErrorMapper.from);
      FlavorConfig(
        flavor: Flavor.DEV,
        color: AppColorScheme.blue,
        values: FlavorValues(
            baseUrl: Environment.baseUrlDev,
            baseWebSocketUrl: Environment.baseWebSocketUrlDev,
            imageUrl: Environment.imageUrlDev),
      );
      runApp(RadioLifeAppWidget());
    },
    (error, stackTrace) => debugPrint(stackTrace.toString()),
  );
}
