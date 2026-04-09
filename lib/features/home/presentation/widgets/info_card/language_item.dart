import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/app_sizes.dart';
import 'package:my_portfolio/core/widgets/padding/app_padding.dart';
import 'package:my_portfolio/core/widgets/text/app_text.dart';

class LanguageItem extends StatelessWidget {
  const LanguageItem({
    super.key,
    required this.name,
    required this.level,
  });

  final String name;
  final String level;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return AppPadding(
      bottom: AppSize.s12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: AppText(
              name,
              contentStyle: ContentStyle.titleMedium,
              contentColor: colors.onSurface.withValues(alpha: 0.8),
              fontWeight: FontWeight.bold,
            ),
          ),
          Flexible(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSize.s16.value, vertical: AppSize.s4.value),
              decoration: BoxDecoration(
                color: colors.primary.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(20),
              ),
              child: AppText(
                level,
                contentStyle: ContentStyle.bodySmall,
                contentColor: colors.onSurface.withValues(alpha: 0.7),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
