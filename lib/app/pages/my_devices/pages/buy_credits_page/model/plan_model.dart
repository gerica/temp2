import 'dart:ui';

class PlanModel {
  final String id;
  final String name;
  final String price;
  final String amountOfCredits;
  final Color textColor;
  final Color backgroundColor;
  final bool isSelected;

  PlanModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.amountOfCredits,
      required this.textColor,
      required this.backgroundColor,
      required this.isSelected});

  PlanModel copyWith({
    String? id,
    String? name,
    String? price,
    String? amountOfCredits,
    Color? textColor,
    Color? backgroundColor,
    bool? isSelected,
  }) =>
      PlanModel(
        id: id ?? this.id,
        name: name ?? this.name,
        price: price ?? this.price,
        amountOfCredits: amountOfCredits ?? this.amountOfCredits,
        textColor: textColor ?? this.textColor,
        backgroundColor: backgroundColor ?? this.backgroundColor,
        isSelected: isSelected ?? this.isSelected,
      );
}
