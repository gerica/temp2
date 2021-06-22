import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/widget/app_bar/radiolife_app_bar_widget.dart';
import 'package:radio_life/app/widget/cards/report_card_widget.dart';
import 'package:radio_life/app/widget/dialog/reports_filter_dialog/show_reports_filter_dialog_widget.dart';
import 'package:radio_life/app/widget/navigation/app_bottom_navigation_bar.dart';

import '../../../generated/l10n.dart';
import '../../helper/dialog_helper.dart';
import 'pages/report_details/params/report_details_params.dart';
import 'pages/report_details/report_details_page.dart';
import 'reports_controller.dart';

class ReportsPage extends GetView<ReportsController> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: RadioLifeAppBarWidget(
          showBackButton: false,
          brightness: Brightness.dark,
          titleText: S.of(context).reports,
          backgroundColor: AppColorScheme.primarySwatch,
          actions: [
            IconButton(
                onPressed: () {
                  Get.appDialog(
                    pageChild: ReportsFilterDialogWidget(
                      onApplyFilter: (filterData) {},
                      onCancel: () {},
                    ),
                  );
                },
                icon: const Icon(Icons.filter_list, color: AppColorScheme.white))
          ],
        ),
        body: Center(
          child: Container(
            constraints: BoxConstraints(
                maxWidth: context.breakpoint > LayoutBreakpoint.xs
                    ? 600
                    : MediaQuery.of(context).size.width),
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: controller.reports.length,
              itemBuilder: (context, index) => ReportCardWidget(
                onTap: () {
                  ReportDetailsPage.navigateWith(
                    params: ReportDetailsParams(
                        report: controller.reports[index], status: controller.status[index]),
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
          ),
        ),
        bottomNavigationBar: const AppBottomNavigationBarWidget(
          currentIndex: 2,
        ),
      );
}