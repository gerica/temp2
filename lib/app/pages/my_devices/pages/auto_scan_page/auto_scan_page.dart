import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/styles/app_spacing.dart';
import 'package:radio_life/app/widget/app_bar/radiolife_app_bar_widget.dart';
import 'package:radio_life/app/widget/navigation/app_bottom_navigation_bar.dart';
import 'package:radio_life/core/data/enum/status.dart';

import '../../../../../generated/l10n.dart';
import 'auto_scan_controller.dart';

class AutoScanPage extends GetView<AutoScanController> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: RadioLifeAppBarWidget(
          showBackButton: true,
          brightness: Brightness.dark,
          titleText: S.of(context).autoScan,
          backgroundColor: AppColorScheme.primarySwatch,
          onBackButtonPressed: () {
            Get.back();
          },
        ),
        body: Container(
          padding: const EdgeInsets.all(AppSpacing.medium),
          child: Obx(() {
            final data = controller.state.value.data;
            final error = controller.state.value.error;
            return controller.state.value.status == Status.loading
                ? Center(
                    child: Lottie.asset('assets/loading/loading_scan.json'),
                  )
                : controller.state.value.status == Status.success
                    ? ListView.builder(
                        itemCount: data?.length ?? 0,
                        itemBuilder: (context, index) {
                          if (data == null) return Container();
                          final item = data[index];
                          return Container(
                            child: Text(item.device.name),
                          );
                        },
                      )
                    : Container(
                        child: Text(error?.title ?? ''),
                      );
          }),
        ),
        bottomNavigationBar: const AppBottomNavigationBarWidget(
          currentIndex: 1,
        ),
      );
}
