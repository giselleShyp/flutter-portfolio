import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/core/constants/app_sizes.dart';
import 'package:my_portfolio/core/layouts/main_layout.dart';
import 'package:my_portfolio/features/skills/presentation/providers/skills_provider.dart';
import 'package:my_portfolio/features/skills/presentation/widgets/skill_section_card.dart';
import 'package:my_portfolio/features/skills/presentation/widgets/state/skill_error_state.dart';
import 'package:my_portfolio/features/skills/presentation/widgets/state/skill_loading_state.dart';

import '../../domain/entities/skill_entity.dart';

@RoutePage()
class SkillsScreen extends ConsumerWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final skills = ref.watch(skillsControllerProvider);

    return MainLayout(
      pageHeaderTitle: "Technical Skills",
      children: [
        skills.when(
          loading: () => const SkillLoadingState(),
          error: (e, _) => SkillErrorState(
            errorMessage: e.toString(),
            onRetry: () => ref.invalidate(skillsControllerProvider),
          ),
          data: (skillsList) => _buildSkillList(skillsList),
        )
      ],
    );
  }

  Widget _buildSkillList(List<SkillEntity> skillsList) {
    return Column(
      spacing: AppSize.s16.value,
      children: skillsList.asMap().entries.map((entry) {
        final index = entry.key;
        final skill = entry.value;

        return SkillSectionCard(
          title: skill.title,
          iconCode: skill.iconCode,
          skills: skill.skills,
        )
            .animate()
            .fadeIn(
                duration: 400.ms,
                delay: (index * 100)
                    .ms // ⏳ Each card waits 150ms longer than the last
                )
            .slideX(
              begin: 0.2, // Slides in slightly from the right
              end: 0,
              curve: Curves.easeOutQuad,
            )
            .scale(
              begin: const Offset(0.9, 0.9), // Subtle growth effect
              end: const Offset(1, 1),
            ); // or your custom widget
      }).toList(),
    );
  }
}
