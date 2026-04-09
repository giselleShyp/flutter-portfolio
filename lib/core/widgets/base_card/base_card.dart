import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/app_sizes.dart';
import 'package:my_portfolio/core/widgets/padding/app_padding.dart';

class BaseCard extends StatelessWidget {
  const BaseCard({
    super.key,
    required this.child,
    this.padding = AppSize.s16, // Default padding from your Enum
    this.margin,
    this.shape,
  });

  final Widget child;
  final AppSize padding;
  final AppSize? margin;
  final ShapeBorder? shape;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin != null ? EdgeInsets.all(margin!.value) : EdgeInsets.zero,
      shape: shape,
      child: AppPadding(
        all: padding,
        child: child,
      ),
    );
  }
}
