
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:radio_life/di/di.dart';

import 'app/radio_life_app_widget.dart';
import 'app/styles/app_color_scheme.dart';
import 'core/data/helpers/error_mapper.dart';
import 'core/data/model/resource.dart';
import 'flavors/environment.dart';
import 'flavors/flavor_values.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runZonedGuarded(
        () async {
      Resource.setErrorMapper(ErrorMapper.from);
      FlavorConfig(
        flavor: Flavor.DEV,
        color: AppColorScheme.success,
        values: FlavorValues(
            baseUrl: Environment.baseUrlDev,
            baseWebSocketUrl: Environment.baseWebSocketUrlDev,
            imageUrl: Environment.imageUrlDev),
      );
      await configureInjection();
      runApp(RadioLifeAppWidget());
    },
        (error, stackTrace) => debugPrint(stackTrace.toString()),
  );
}