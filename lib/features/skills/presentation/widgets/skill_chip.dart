import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/app_radius.dart';
import 'package:my_portfolio/core/constants/gaps.dart';
import 'package:my_portfolio/core/widgets/text/app_text.dart';

class SkillChip extends StatelessWidget {
  final String label;
  final IconData? icon;

  const SkillChip({super.key, required this.label, this.icon});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg), // Pill shape
        border: Border.all(
          color: theme.colorScheme.outline.withValues(alpha: 0.5),
        ),
        // Subtle hover-like glow
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 16, color: theme.colorScheme.primary),
            Gaps.w8,
          ],
          AppText(
            label,
            contentStyle: ContentStyle.labelMedium,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
