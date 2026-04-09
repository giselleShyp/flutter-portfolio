import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/core/constants/gaps.dart';
import 'package:my_portfolio/core/layouts/main_layout.dart';
import 'package:my_portfolio/core/widgets/text/app_text.dart';
import 'package:my_portfolio/features/experience/domain/entities/experience_entity.dart';
import 'package:my_portfolio/features/experience/presentation/provider/experience_provider.dart';
import 'package:my_portfolio/features/experience/presentation/widgets/selectable_experience_item/selectable_experience_item.dart';
import 'package:my_portfolio/features/experience/presentation/widgets/state/experience_error_state.dart';
import 'package:my_portfolio/features/experience/presentation/widgets/state/experience_loading_state.dart';

@RoutePage()
class ExperienceScreen extends ConsumerWidget {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final experiences = ref.watch(experienceControllerProvider);
    return MainLayout(
      pageHeaderTitle: "Experience",
      children: [
        experiences.when(
          loading: () => const ExperienceLoadingState(),
          error: (e, _) => ExperienceErrorState(
            error: e.toString(),
            onRetry: () => ref.invalidate(experienceControllerProvider),
          ),
          data: (experiencesList) {
            final professionalWork =
                experiencesList.where((exp) => !exp.isVolunteer).toList();
            final volunteeringWork =
                experiencesList.where((exp) => exp.isVolunteer).toList();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (professionalWork.isNotEmpty)
                  _buildExperiencesList(professionalWork),
                if (professionalWork.isNotEmpty && volunteeringWork.isNotEmpty)
                  Gaps.h32,
                if (volunteeringWork.isNotEmpty) ...[
                  _buildSectionHeader("Volunteering"),
                  Gaps.h16,
                  _buildExperiencesList(volunteeringWork),
                ],
              ],
            );
          },
        ),
      ],
    );
  }
}

Widget _buildSectionHeader(String title) {
  return AppText(
    title,
    contentStyle: ContentStyle.headlineSmall,
    fontWeight: FontWeight.bold,
  );
}

Widget _buildExperiencesList(List<ExperienceEntity> experiencesList) {
  return Column(
    children: experiencesList.map((experience) {
      return SelectableExperienceItem(
        experienceEntity: experience,
        isFirst: experience == experiencesList.first,
        isLast: experience == experiencesList.last,
      ); // or your custom widget
    }).toList(),
  );
}
