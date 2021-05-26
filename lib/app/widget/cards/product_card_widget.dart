import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:radio_life/app/helper/ui_helper.dart';
import 'package:radio_life/app/styles/app_theme.dart';

class ProductCardWidget extends StatelessWidget {
  final String name;
  final String description;
  final VoidCallback onTap;

  const ProductCardWidget({required this.name, required this.description, required this.onTap});

  @override
  Widget build(BuildContext context) => AspectRatio(
        aspectRatio: MediaQuery.of(context).size.width / 115,
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 2,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(8),
            splashColor: AppColorScheme.accentColor.withOpacity(0.1),
            child: Container(
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColorScheme.accentColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                        ),
                      ),
                      child: const Center(child: Icon(Icons.radio, color: Colors.white)),
                    ),
                  ),
                  UIHelper.horizontalSpaceMedium,
                  Flexible(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                              color: AppColorScheme.textPrimary, fontSize: AppFontSize.medium),
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur',
                          style: TextStyle(
                              color: AppColorScheme.textPrimary, fontSize: AppFontSize.secondary),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('name', name));
    properties.add(StringProperty('description', description));
    properties.add(ObjectFlagProperty<VoidCallback>.has('onTap', onTap));
  }
}
