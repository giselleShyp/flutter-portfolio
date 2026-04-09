import 'package:flutter/material.dart';
import 'package:my_portfolio/features/experience/domain/entities/experience_entity.dart';
import 'package:my_portfolio/features/experience/presentation/widgets/experience_card/experience_card.dart';
import 'package:my_portfolio/features/experience/presentation/widgets/time_line_item/time_line_item.dart';

class SelectableExperienceItem extends StatefulWidget {
  final ExperienceEntity experienceEntity;
  final bool isFirst;
  final bool isLast;

  const SelectableExperienceItem({
    super.key,
    required this.experienceEntity,
    this.isFirst = false,
    this.isLast = false,
  });

  @override
  State<SelectableExperienceItem> createState() =>
      _SelectableExperienceItemState();
}

class _SelectableExperienceItemState extends State<SelectableExperienceItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return TimelineItem(
      isFirst: widget.isFirst,
      isLast: widget.isLast,
      isActive: _isExpanded, // The dot fills when expanded!
      child: ExperienceCard(
        experience: widget.experienceEntity,
        onExpansionChanged: (expanded) {
          setState(
            () => _isExpanded = expanded,
          );
        },
      ),
    );
  }
}
