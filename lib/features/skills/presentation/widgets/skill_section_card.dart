import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/gaps.dart';
import 'package:my_portfolio/core/widgets/base_card/base_card.dart';
import 'package:my_portfolio/core/widgets/text/app_text.dart';
import 'package:my_portfolio/features/skills/presentation/widgets/skill_chip.dart';

class SkillSectionCard extends StatelessWidget {
  const SkillSectionCard({
    super.key,
    required this.title,
    required this.iconCode,
    required this.skills,
  });

  final String title;
  final int iconCode;
  final List<String> skills;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                IconData(iconCode, fontFamily: 'MaterialIcons'),
                color: Theme.of(context).colorScheme.primary,
                size: 20,
              ),
              Gaps.w12,
              AppText(
                title,
                contentStyle: ContentStyle.titleSmall,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.1,
              ),
            ],
          ),
          Gaps.h16,
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: skills.map((skill) => SkillChip(label: skill)).toList(),
          ),
        ],
      ),
    );
  }
}
