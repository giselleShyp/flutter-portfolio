import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/app_radius.dart';
import 'package:my_portfolio/core/constants/app_sizes.dart';
import 'package:my_portfolio/core/widgets/padding/app_padding.dart';

class ProjectCardContainer extends StatelessWidget {
  const ProjectCardContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;
    final outlineColor =
        theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.2);

    double radius = AppRadius.md;

    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Stack(
        children: [
          // 1. The Main Card Body (Uniform Gray Outline)
          Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(radius),
              border: Border.all(color: outlineColor, width: 1.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: AppPadding(
              x: AppSize.s16,
              y: AppSize.s24,
              child: child,
            ),
          ),

          // 2. The Blue Top Indicator (Overlays the gray border)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 4.0, // Thick top border
              decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(radius),
                  topRight: Radius.circular(radius),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
