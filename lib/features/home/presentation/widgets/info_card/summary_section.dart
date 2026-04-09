import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/app_radius.dart';
import 'package:my_portfolio/core/constants/app_sizes.dart';
import 'package:my_portfolio/core/constants/gaps.dart';
import 'package:my_portfolio/core/widgets/text/app_text.dart';

class SummarySection extends StatelessWidget {
  const SummarySection({
    super.key,
    required this.icon,
    required this.title,
    required this.children,
  });

  final IconData icon;
  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(AppSize.s12.value),
          decoration: BoxDecoration(
            color: colors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          child: Icon(icon, color: colors.primary, size: AppSize.s16.value),
        ),
        Gaps.w12,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                title,
                contentStyle: ContentStyle.bodyMedium,
                contentColor: colors.primary,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
              ),
              Gaps.h16,
              ...children,
            ],
          ),
        ),
      ],
    );
  }
}
