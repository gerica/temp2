import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_life/app/pages/home/pages/reports/pages/report_details/params/report_details_params.dart';
import 'package:radio_life/app/pages/home/pages/reports/pages/report_details/report_details_page.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/widget/app_bar/radiolife_app_bar_widget.dart';
import 'package:radio_life/app/widget/cards/report_card_widget.dart';

import '../../../../../generated/l10n.dart';
import 'reports_controller.dart';

class ReportsPage extends GetView<ReportsController> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: RadioLifeAppBarWidget(
          showBackButton: true,
          brightness: Brightness.dark,
          titleText: S.of(context).reports,
          backgroundColor: AppColorScheme.accentColor,
          onBackButtonPressed: () {
            Get.back();
          },
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.filter_list, color: AppColorScheme.white))
          ],
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: controller.reports.length,
          itemBuilder: (context, index) => ReportCardWidget(
            onTap: () {
              ReportDetailsPage.navigateWith(
                params: ReportDetailsParams(
                  report: controller.reports[index],
                  status: controller.status[index]
                ),
              );
            },
            name: controller.reports[index],
            status: controller.status[index],
            color: index == 0
                ? AppColorScheme.yellow
                : index == 1
                    ? AppColorScheme.orange
                    : AppColorScheme.success,
          ),
        ),
      );
}
