import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_life/app/helper/platform_svg.dart';
import 'package:radio_life/app/images/app_svg_images.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';

import '../../../generated/l10n.dart';
import 'app_bottom_navitation_bar_controller.dart';

class AppBottomNavigationBarWidget extends GetWidget<AppBottomNavigationController> {
  final int currentIndex;

  const AppBottomNavigationBarWidget({required this.currentIndex});

  @override
  Widget build(BuildContext context) => GetBuilder<AppBottomNavigationController>(
        initState: (_) {
          controller.changePage(currentIndex);
        },
        builder: (logic) => Container(
          color: AppColorScheme.white,
          child: Obx(
            () => BottomNavigationBar(
                items: [
                  buildBottomNavigationBarItem(
                    AppSvgImages.icProducts,
                    S.of(context).products,
                  ),
                  buildBottomNavigationBarItem(
                    AppSvgImages.icMyDevices,
                    S.of(context).myDevices,
                  ),
                  buildBottomNavigationBarItem(AppSvgImages.icReports, S.of(context).reports),
                  buildBottomNavigationBarItem(
                    AppSvgImages.icSupport,
                    S.of(context).support,
                  ),
                  buildBottomNavigationBarItem(
                    AppSvgImages.icProfile,
                    S.of(context).profile,
                  ),
                ],
                currentIndex: controller.bottomBarCurrentIndex.value,
                selectedFontSize: 10,
                unselectedFontSize: 10,
                backgroundColor: AppColorScheme.white,
                selectedItemColor: Colors.black,
                unselectedItemColor: const Color(0xFFA8A8A8),
                type: BottomNavigationBarType.fixed,
                onTap: _changeBottomBarNavigationIndex),
          ),
        ),
      );

  BottomNavigationBarItem buildBottomNavigationBarItem(String assetSvgImages, String label) =>
      BottomNavigationBarItem(
        icon: Opacity(
          opacity: 0.4,
          child: PlatformSvg.asset(assetSvgImages, height: 25, fit: BoxFit.cover),
        ),
        activeIcon: PlatformSvg.asset(assetSvgImages, height: 25),
        label: label,
      );

  void _changeBottomBarNavigationIndex(int index) => controller.changePage(index);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('currentIndex', currentIndex));
  }
}
