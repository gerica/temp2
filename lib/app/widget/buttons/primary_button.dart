import 'package:exchangeapp_flutter/app/styles/app_theme.dart';
import 'package:exchangeapp_flutter/core/data/enum/status.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum PrimaryButtonColor { success, error, primary, emphasis }

extension PrimaryButtonColorExtension on PrimaryButtonColor {
  Color get backgroundColor {
    switch (this) {
      case PrimaryButtonColor.success:
        return AppColorScheme.successLight;
      case PrimaryButtonColor.error:
        return AppColorScheme.errorLight;
      case PrimaryButtonColor.primary:
        return AppColorScheme.primaryLight.withOpacity(0.2);
      case PrimaryButtonColor.emphasis:
        return AppColorScheme.primary;
    }
  }

  Color get textColor {
    switch (this) {
      case PrimaryButtonColor.success:
        return AppColorScheme.success;
      case PrimaryButtonColor.error:
        return AppColorScheme.error;
      case PrimaryButtonColor.primary:
        return AppColorScheme.primaryLight;
      case PrimaryButtonColor.emphasis:
        return AppColorScheme.emphasis;
    }
  }

  Color get borderColor {
    switch (this) {
      case PrimaryButtonColor.success:
        return AppColorScheme.success;
      case PrimaryButtonColor.error:
        return AppColorScheme.error;
      case PrimaryButtonColor.primary:
        return AppColorScheme.primaryLight;
      case PrimaryButtonColor.emphasis:
        return AppColorScheme.emphasis;
    }
  }
}

enum PrimaryButtonType { circular, rounded }

extension PrimaryButtonTypeExtension on PrimaryButtonType {
  double get cornerRadius {
    switch (this) {
      case PrimaryButtonType.circular:
        return 100;
      case PrimaryButtonType.rounded:
        return 15;
    }
  }
}

enum PrimaryButtonStyle { filled, bordered, clear }

extension PrimaryButtonStyleExtension on PrimaryButtonStyle {
  bool get showBackground {
    switch (this) {
      case PrimaryButtonStyle.filled:
        return true;
      case PrimaryButtonStyle.bordered:
        return false;
      case PrimaryButtonStyle.clear:
        return false;
    }
  }

  bool get showBorder {
    switch (this) {
      case PrimaryButtonStyle.filled:
        return false;
      case PrimaryButtonStyle.bordered:
        return true;
      case PrimaryButtonStyle.clear:
        return false;
    }
  }
}

class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final PrimaryButtonColor color;
  final PrimaryButtonType type;
  final PrimaryButtonStyle style;
  final Status state;
  double fontSize;
  double height;
  FontWeight fontWeight;
  double width;

  PrimaryButton({
    required this.onPressed,
    required this.title,
    required this.color,
    required this.type,
    required this.style,
    required this.state,
    this.fontSize = 20,
    this.fontWeight = FontWeight.bold,
    this.height = 65,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) => Container(
        height: height,
        width: width,
        child: RawMaterialButton(
          elevation: 0,
          hoverElevation: 0,
          focusElevation: 0,
          highlightElevation: 0,
          fillColor: style.showBackground ? color.backgroundColor : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(type.cornerRadius),
            side: BorderSide(
              color: style.showBorder ? color.borderColor : Colors.transparent,
              width: 2,
            ),
          ),
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
            child: Visibility(
              visible: state == Status.loading,
              replacement: Text(
                title,
                style: TextStyle(
                  color: color.textColor,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                ),
              ),
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(AppColorScheme.primaryLight),
                  strokeWidth: 2,
                ),
              ),
            ),
          ),
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('title', title));
    properties.add(ObjectFlagProperty<Function()>.has('onPressed', onPressed));
    properties.add(EnumProperty<PrimaryButtonColor>('color', color));
    properties.add(EnumProperty<PrimaryButtonType>('type', type));
    properties.add(EnumProperty<PrimaryButtonStyle>('style', style));
    properties.add(DoubleProperty('fontSize', fontSize));
    properties.add(DiagnosticsProperty<FontWeight>('fontWeight', fontWeight));
    properties.add(DiagnosticsProperty<Status>('state', state));
    properties.add(DoubleProperty('height', height));
    properties.add(DoubleProperty('width', width));
  }
}
