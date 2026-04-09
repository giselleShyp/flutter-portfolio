import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/gaps.dart';
import 'package:my_portfolio/core/widgets/text/app_text.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({
    super.key,
    required this.title,
    this.subtitle,
    required this.description,
  });

  final String title;
  final String? subtitle;
  final String description;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          title,
          contentStyle: ContentStyle.titleMedium,
          fontWeight: FontWeight.bold,
        ),
        if (subtitle != null) ...[
          Gaps.h4,
          AppText(
            subtitle!,
            contentStyle: ContentStyle.bodyMedium,
            contentColor: colors.onSurface.withValues(alpha: 0.7),
            fontWeight: FontWeight.w500,
          ),
        ],
        Gaps.h8,
        AppText(
          description,
          contentStyle: ContentStyle.bodyMedium,
          contentColor: colors.onSurfaceVariant,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}
