import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/app_radius.dart';
import 'package:my_portfolio/core/constants/gaps.dart';
import 'package:my_portfolio/core/widgets/base_card/base_card.dart';
import 'package:shimmer/shimmer.dart';

class SkillLoadingState extends StatelessWidget {
  const SkillLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Shimmer Icon
              _shimmerBox(context, 40, 40, radius: AppRadius.md),
              Gaps.w12,
              // Shimmer Title
              _shimmerBox(context, 120, 20),
            ],
          ),
          Gaps.h24,
          // Shimmer Chips
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List.generate(6,
                (index) => _shimmerBox(context, 70, 32, radius: AppRadius.lg)),
          ),
        ],
      ),
    );
  }

  Widget _shimmerBox(BuildContext context, double width, double height,
      {double? radius}) {
    final theme = Theme.of(context).colorScheme;

    return Shimmer.fromColors(
      baseColor: theme.onSurfaceVariant.withValues(alpha: 0.2),
      highlightColor: theme.onSurfaceVariant.withValues(alpha: 0.1),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius ?? 4),
        ),
      ),
    );
  }
}
