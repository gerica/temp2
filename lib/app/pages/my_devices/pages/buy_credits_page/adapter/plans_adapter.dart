import 'package:flutter/material.dart';
import 'package:radio_life/app/helper/currency_helper.dart';
import 'package:radio_life/app/pages/my_devices/pages/buy_credits_page/model/plan_model.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/core/domain/entities/plans/plan_entity.dart';

import '../../../../../../generated/l10n.dart';

abstract class PlansAdapter {
  PlansAdapter._();

  static List<PlanModel> toModel(List<PlanEntity?> plans) => plans
      .map((entity) => PlanModel(
            id: entity?.id ?? '',
            name: entity?.name ?? '',
            price: CurrencyHelper.doubleToCurrency(entity?.value ?? 0),
            amountOfCredits: S.current.creditsQuantity(entity?.credit ?? 0),
            textColor: Colors.black,
            isSelected: false,
            backgroundColor: AppColorScheme.white,
          ))
      .toList();
}
