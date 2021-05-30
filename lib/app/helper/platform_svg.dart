import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PlatformSvg {
  static Widget asset(String asset,
      {double? width,
      double? height,
      BoxFit fit = BoxFit.contain,
      Color? color,
      AlignmentGeometry alignment = Alignment.center,
      String? semanticsLabel}) {
    if (kIsWeb) {
      return Image.network(asset,
          width: width,
          height: height,
          fit: fit,
          color: color,
          alignment: alignment,
          semanticLabel: semanticsLabel);
    }
    return SvgPicture.asset(asset,
        width: width,
        height: height,
        fit: fit,
        color: color,
        alignment: alignment,
        semanticsLabel: semanticsLabel);
  }
}
