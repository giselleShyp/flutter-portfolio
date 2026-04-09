import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/app_sizes.dart';
import 'package:my_portfolio/core/constants/gaps.dart';
import 'package:my_portfolio/core/widgets/buttons/app_text_button.dart';
import 'package:my_portfolio/core/widgets/padding/app_padding.dart';
import 'package:my_portfolio/core/widgets/text/app_text.dart';

class SkillEmptyState extends StatelessWidget {
  const SkillEmptyState({
    super.key,
    required this.onReconnectingPressed,
  });

  final VoidCallback onReconnectingPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;

    return Center(
      child: AppPadding(
        all: AppSize.s32,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(AppSize.s24.value),
              decoration: BoxDecoration(
                color: primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.code_off_rounded,
                size: 64,
                color: primary,
              ),
            ),
            Gaps.h32,
            AppText(
              "Technical Stack Unavailable",
              contentStyle: ContentStyle.titleLarge,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
            ),
            Gaps.h12,
            AppText(
              "It seems the skill database is currently offline. You can still explore my technical expertise and Flutter implementations directly on GitHub.",
              contentStyle: ContentStyle.bodyMedium,
              contentColor: theme.colorScheme.onSurfaceVariant,
              textAlign: TextAlign.center,
            ),
            Gaps.h32,
            AppTextButton(
              onPressed: onReconnectingPressed,
              child: AppText(
                "Try Reconnecting",
                contentStyle: ContentStyle.bodyLarge,
                contentColor: primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
