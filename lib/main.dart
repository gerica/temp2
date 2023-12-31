import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:radio_life/app/data/helpers/error_mapper.dart';
import 'package:radio_life/app/data/model/resource.dart';
import 'package:radio_life/app/data/util/app_http_override.dart';
import 'package:radio_life/app/helper/provider_access_data.dart';
import 'package:radio_life/app/radio_life_app_widget.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:universal_io/io.dart';

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
      await ProviderAccessData().init();
      runApp(RadioLifeAppWidget());
    },
    (error, stackTrace) => FirebaseCrashlytics.instance.recordError(error, stackTrace),
  );
}
