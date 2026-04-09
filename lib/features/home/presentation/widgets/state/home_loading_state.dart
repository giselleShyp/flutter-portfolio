import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/app_sizes.dart';
import 'package:my_portfolio/core/constants/gaps.dart';
import 'package:my_portfolio/core/widgets/base_card/base_card.dart';
import 'package:my_portfolio/core/widgets/padding/app_padding.dart';
import 'package:shimmer/shimmer.dart';

class HomeLoadingState extends StatelessWidget {
  const HomeLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BaseCard(
      child: Shimmer.fromColors(
        baseColor: theme.colorScheme.onSurface.withValues(alpha: 0.1),
        highlightColor: theme.colorScheme.onSurface.withValues(alpha: 0.05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Header Shimmer
              _buildBox(height: 100, width: double.infinity),
              Gaps.h24,

              // Social Buttons Shimmer
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) => AppPadding(
                    x: AppSize.s8,
                    child: _buildBox(height: 50, width: 50, isCircle: true),
                  ),
                ),
              ),
              Gaps.h24,

              // About Me Card Shimmer
              _buildBox(height: 150, width: double.infinity),
              Gaps.h16,

              // Education/Certificates Shimmer
              _buildBox(height: 100, width: double.infinity),
              Gaps.h16,
              _buildBox(height: 100, width: double.infinity),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBox({
    required double height,
    required double width,
    bool isCircle = false,
  }) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: isCircle ? null : BorderRadius.circular(12),
      ),
    );
  }
}
