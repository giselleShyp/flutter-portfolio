import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/app_sizes.dart';
import 'package:my_portfolio/core/constants/gaps.dart';
import 'package:my_portfolio/core/widgets/padding/app_padding.dart';
import 'package:my_portfolio/core/widgets/text/app_text.dart';

class ExperienceEmptyState extends StatelessWidget {
  const ExperienceEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: AppPadding(
        all: AppSize.s32,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.history_edu_rounded,
              size: 72,
              color: theme.colorScheme.primary.withValues(alpha: 0.2),
            ),
            Gaps.h24,
            AppText(
              "No Experience Records",
              contentStyle: ContentStyle.titleLarge,
              fontWeight: FontWeight.bold,
            ),
            Gaps.h12,
            AppText(
              "I am constantly growing my professional path. Check back soon or view my live projects for current work.",
              textAlign: TextAlign.center,
              contentColor: theme.colorScheme.onSurfaceVariant,
            ),
          ],
        ),
      ),
    );
  }
}
