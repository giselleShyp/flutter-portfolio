import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/app_sizes.dart';
import 'package:my_portfolio/core/constants/gaps.dart';

class TimelineItem extends StatelessWidget {
  const TimelineItem({
    super.key,
    required this.child,
    this.isFirst = false,
    this.isLast = false,
    this.isActive = false,
  });

  final Widget child;
  final bool isFirst;
  final bool isLast;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Stack(
      children: [
        // 1. The Vertical Line (Positioned to stay behind the dot)
        Positioned(
          left: 6, // Half of the dot width (14/2 = 7, minus half of line width)
          top: isFirst ? 20 : 0,
          bottom: isLast ? 20 : 0,
          child: Container(
            width: 2,
            color: primary.withValues(alpha:  0.2),
          ),
        ),

        // 2. The Content and Dot Row
        Padding(
          padding: EdgeInsets.only(bottom: AppSize.s16.value),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // The Dot
              Container(
                margin: EdgeInsets.only(top: AppSize.s20.value),
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isActive
                      ? primary
                      : Theme.of(context).scaffoldBackgroundColor,
                  border: Border.all(color: primary, width: 2),
                  boxShadow: isActive
                      ? [
                          BoxShadow(
                            color: primary.withValues(alpha: 0.4),
                            blurRadius: 8,
                            spreadRadius: 1,
                          )
                        ]
                      : [],
                ),
              ),
              Gaps.w16,
              // The Card
              Expanded(child: child),
            ],
          ),
        ),
      ],
    );
  }
}
