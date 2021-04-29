
import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

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
      await _initializeFirebase();
      Resource.setErrorMapper(ErrorMapper.from);
      FlavorConfig(
        flavor: Flavor.DEV,
        color: AppColorScheme.primary,
        values: FlavorValues(
            baseUrl: Environment.baseUrlDev,
            baseWebSocketUrl: Environment.baseWebSocketUrlDev,
            imageUrl: Environment.imageUrlDev),
      );
      runApp(RadioLifeAppWidget());
    },
        (error, stackTrace) =>
          FirebaseCrashlytics.instance.recordError(error, stackTrace),
  );
}

// Define an async function to initialize FlutterFire
Future<void> _initializeFirebase() async {
  // Wait for Firebase to initialize
  await Firebase.initializeApp();

  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

  // Pass all uncaught errors to Crashlytics.
  final Function originalOnError = FlutterError.onError!;
  FlutterError.onError = (FlutterErrorDetails errorDetails) async {
    await FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
    // Forward to original handler.
    originalOnError(errorDetails);
  };
}