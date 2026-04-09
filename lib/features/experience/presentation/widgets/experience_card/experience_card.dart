import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/app_radius.dart';
import 'package:my_portfolio/core/constants/app_sizes.dart';
import 'package:my_portfolio/core/constants/gaps.dart';
import 'package:my_portfolio/core/widgets/base_card/base_card.dart';
import 'package:my_portfolio/core/widgets/padding/app_padding.dart';
import 'package:my_portfolio/core/widgets/text/app_text.dart';
import 'package:my_portfolio/features/experience/domain/entities/experience_entity.dart';

class ExperienceCard extends StatefulWidget {
  const ExperienceCard({
    super.key,
    required this.experience,
    required this.onExpansionChanged,
  });

  final ExperienceEntity experience;
  final Function(bool) onExpansionChanged;

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
  bool _isExpanded = false;

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
    });

    widget.onExpansionChanged(_isExpanded);
  }

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      padding: AppSize.s0,
      child: InkWell(
        onTap: _toggleExpansion,
        borderRadius: BorderRadius.circular(AppRadius.md),
        // Inside your ThemeData
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        child: AppPadding(
          all: AppSize.s16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Show company name and total duration
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          widget.experience.role,
                          contentStyle: ContentStyle.titleMedium,
                          fontWeight: FontWeight.bold,
                        ),
                        Gaps.h4,
                        AppText(
                          widget.experience.companyName,
                          contentStyle: ContentStyle.labelMedium,
                          contentColor: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                        Gaps.h4,
                        AppText(
                          widget.experience.dateRange,
                          contentStyle: ContentStyle.labelSmall,
                          contentColor:
                              Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ],
                    ),
                  ),
                  AnimatedRotation(
                    turns: _isExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 250),
                    child: const Icon(Icons.keyboard_arrow_down),
                  ),
                ],
              ),
              // Show roles list when expanded
              AnimatedSize(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                child: _isExpanded
                    ? Column(
                        children: [
                          const SizedBox(height: 16),
                          ...widget.experience.descriptions.map(
                              (point) => _buildBulletPoint(context, point)),
                        ],
                      )
                    : const SizedBox(width: double.infinity, height: 0),
              ),
            ],
          ),
        ),
      ),
    );
  }

//   Widget _buildRoleItem(BuildContext context, String point) {
//     return AppPadding(
//       bottom: AppSize.s12,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ...point.descriptions
//               .map((point) => _buildBulletPoint(context, point)),
//         ],
//       ),
//     );
//   }
// }

  Widget _buildBulletPoint(BuildContext context, String text) {
    return AppPadding(
      bottom: AppSize.s8,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            "•",
            contentColor: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
          Gaps.w8,
          Expanded(
            child: AppText(
              text,
              contentStyle: ContentStyle.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
