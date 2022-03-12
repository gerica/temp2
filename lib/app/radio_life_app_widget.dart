import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';

import 'package:radio_life/generated/l10n.dart';
import 'radio_life_app_binding.dart';
import 'radio_life_app_routes.dart';
import 'styles/app_color_scheme.dart';
import 'styles/app_theme_data.dart';
import 'utils/widget_utils.dart';

class RadioLifeAppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Layout(
        child: GetMaterialApp(
          navigatorKey: Get.key,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          themeMode: ThemeMode.light,
          builder: (context, child) => Scaffold(
            backgroundColor: AppColorScheme.background,
            body: AnnotatedRegion<SystemUiOverlayStyle>(
              sized: false,
              value: const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
              child: GestureDetector(
                onTap: () => WidgetUtils.hideKeyboard(context),
                child: child,
              ),
            ),
          ),
          debugShowCheckedModeBanner: false,
          title: 'Radiolife',
          theme: AppThemeData.themeDataLight,
          darkTheme: AppThemeData.themeDataLight,
          getPages: RadioLifeAppRoutes.routes,
          initialRoute: Routes.signUp,
          initialBinding: RadioLifeAppBinding(),
        ),
      );
}
