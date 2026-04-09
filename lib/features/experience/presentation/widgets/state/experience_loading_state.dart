import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/gaps.dart';
import 'package:my_portfolio/core/widgets/base_card/base_card.dart';
import 'package:shimmer/shimmer.dart';

class ExperienceLoadingState extends StatelessWidget {
  const ExperienceLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BaseCard(
      child: Shimmer.fromColors(
        baseColor: theme.colorScheme.onSurface.withValues(alpha: 0.1),
        highlightColor: theme.colorScheme.onSurface.withValues(alpha: 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Role Title
                      Container(
                        width: 180,
                        height: 18,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      Gaps.h8,
                      // Company Name
                      Container(
                        width: 120,
                        height: 14,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      Gaps.h8,
                      // Period
                      Container(
                        width: 90,
                        height: 12,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  ),
                ),
                // Arrow Icon placeholder
                Container(
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
