import 'dart:ui';

class PlanModel {
  final String name;
  final String price;
  final String amountOfCredits;
  final Color textColor;
  final Color backgroundColor;

  PlanModel({
    required this.name,
    required this.price,
    required this.amountOfCredits,
    required this.textColor,
    required this.backgroundColor
  });
}
