import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:layout/layout.dart';
import 'package:radio_life/app/helper/ui_helper.dart';
import 'package:radio_life/app/radio_life_app_routes.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/widget/app_bar/radiolife_app_bar_widget.dart';
import 'package:radio_life/app/widget/cards/report_card_widget.dart';
import 'package:radio_life/app/widget/navigation/app_bottom_navigation_bar.dart';
import 'package:radio_life/core/domain/entities/exam/exam_entity.dart';

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
          // child: Obx(() => _buildListExam(context)),
          child: _buildListExams(context),
        ),
      ),
      bottomNavigationBar: const AppBottomNavigationBarWidget(
        currentIndex: 1,
      ),
    );
  }

  Widget _buildListExams(BuildContext context) {
    return PagedListView<int, ExamEntity>(
      pagingController: controller.pagingController,
      builderDelegate: PagedChildBuilderDelegate<ExamEntity>(
        itemBuilder: (context, item, index) => _buildContentPage(item),
        firstPageProgressIndicatorBuilder: (_) => _buildProgressIndicator(context),
        noItemsFoundIndicatorBuilder: (_) => _buildNoItemsFoundIndicator(context),
        noMoreItemsIndicatorBuilder: (_) => _buildNoMoreItemsIndicator(context),
      ),
    );
  }

  Widget _buildContentPage(ExamEntity item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ReportCardWidget(
        onTap: () {
          Get.toNamed(Routes.reportDetails, arguments: item);
        },
        model: item,
      ),
    );
  }

  Widget _buildProgressIndicator(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          S.of(context).loading,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildNoItemsFoundIndicator(BuildContext context) {
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

  Widget _buildNoMoreItemsIndicator(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            S.of(context).noMoreExams,
            style: const TextStyle(color: Colors.black),
          ),
          UIHelper.verticalSpaceMedium,
        ],
      ),
    );
  }
}
