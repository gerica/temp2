import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:radio_life/core/data/util/app_http_override.dart';
import 'package:universal_io/io.dart';

import 'app/radio_life_app_widget.dart';
import 'app/styles/app_color_scheme.dart';
import 'core/data/helpers/error_mapper.dart';
import 'core/data/model/resource.dart';
import 'flavors/environment.dart';
import 'flavors/flavor_values.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = AppHttpOverrides();
  await Firebase.initializeApp();
  runZonedGuarded(
    () async {
      Resource.setErrorMapper(ErrorMapper.from);
      FlavorConfig(
        flavor: Flavor.PRODUCTION,
        color: AppColorScheme.primarySwatch,
        values: FlavorValues(
            baseUrl: Environment.baseUrlProd,
            baseWebSocketUrl: Environment.baseWebSocketUrlProd,
            imageUrl: Environment.imageUrlProd),
      );
      runApp(RadioLifeAppWidget());
    },
    (error, stackTrace) => FirebaseCrashlytics.instance.recordError(error, stackTrace),
  );
}
