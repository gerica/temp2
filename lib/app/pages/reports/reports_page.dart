import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';
import 'package:radio_life/app/helper/ui_helper.dart';
import 'package:radio_life/app/radio_life_app_routes.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/widget/app_bar/radiolife_app_bar_widget.dart';
import 'package:radio_life/app/widget/cards/report_card_widget.dart';
import 'package:radio_life/app/widget/navigation/app_bottom_navigation_bar.dart';
import 'package:radio_life/core/data/enum/status.dart';

import '../../../generated/l10n.dart';
import 'reports_controller.dart';

class ReportsPage extends GetView<ReportsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RadioLifeAppBarWidget(
        showBackButton: false,
        brightness: Brightness.dark,
        titleText: S.of(context).reports,
        backgroundColor: AppColorScheme.primarySwatch,
        actions: [
          IconButton(
              onPressed: () => controller.openFilterDialog(),
              icon: const Icon(Icons.filter_list, color: AppColorScheme.white))
        ],
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(
              maxWidth: context.breakpoint > LayoutBreakpoint.xs ? 600 : MediaQuery.of(context).size.width),
          child: Obx(() => _buildListExam(context)),
        ),
      ),
      bottomNavigationBar: const AppBottomNavigationBarWidget(
        currentIndex: 1,
      ),
    );
  }

  Widget _buildListExam(BuildContext context) {
    final data = controller.state.value.data;
    final status = controller.state.value.status;
    if (status == Status.success && data != null && data.isNotEmpty) {
      return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: data.length,
        itemBuilder: (context, index) => ReportCardWidget(
          onTap: () {
            Get.toNamed(Routes.reportDetails);
          },
          model: data[index],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            S.of(context).youHaveNoReports,
            style: const TextStyle(color: Colors.black),
          ),
          UIHelper.verticalSpaceMedium,
        ],
      ),
    );
  }
}
