import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/app_radius.dart';
import 'package:my_portfolio/core/constants/gaps.dart';
import 'package:my_portfolio/core/widgets/base_card/base_card.dart';
import 'package:shimmer/shimmer.dart';

class ProjectLoadingState extends StatelessWidget {
  const ProjectLoadingState({super.key});

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
              children: [
                // Icon Box
                Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(AppRadius.md))),
                Gaps.w16,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(width: 140, height: 16, color: Colors.white),
                    Gaps.h8,
                    Container(width: 80, height: 12, color: Colors.white),
                  ],
                ),
              ],
            ),
            Gaps.h24,
            // Description Lines
            Container(width: double.infinity, height: 12, color: Colors.white),
            Gaps.h8,
            Container(width: double.infinity, height: 12, color: Colors.white),
            Gaps.h24,
            // Tech Chips
            Row(
              children: List.generate(
                3,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Container(
                    width: 60,
                    height: 28,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(AppRadius.lg),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
