import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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
      children: skillsList.map((skill) {
        return SkillSectionCard(
          title: skill.title,
          iconCode: skill.iconCode,
          skills: skill.skills,
        ); // or your custom widget
      }).toList(),
    );
  }
}
