import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/core/constants/app_sizes.dart';
import 'package:my_portfolio/core/layouts/main_layout.dart';

import '../../domain/entities/project_entity.dart';
import '../providers/projects_provider.dart';
import '../widgets/project_card.dart';
import '../widgets/state/project_error_state.dart';
import '../widgets/state/project_loading_state.dart';

@RoutePage()
class ProjectsScreen extends ConsumerWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final projects = ref.watch(projectsControllerProvider);

    return MainLayout(
      pageHeaderTitle: "Projects",
      children: [
        projects.when(
          data: (projectsList) => _buildProjectsList(projectsList),
          loading: () => const ProjectLoadingState(),
          error: (e, _) {
            debugPrint("Error : $e");
            return ProjectErrorState(
              error: e.toString(),
              onRetry: () => ref.invalidate(projectsControllerProvider),
            );
          },
        )
      ],
    );
  }
}

Widget _buildProjectsList(List<ProjectEntity> projectsList) {
  return Column(
    spacing: AppSize.s16.value,
    children: projectsList.asMap().entries.map((entry) {
      final index = entry.key;
      final project = entry.value;

      return ProjectCard(
        title: project.title,
        description: project.description,
        technologies: project.technologies,
        projectType: project.type,
        githubUrl: project.githubUrl,
      )
          .animate()
          .fadeIn(
            duration: 500.ms,
            delay: (index * 200).ms, // Staggered entrance
          )
          .slideX(
            begin: 0.2,
            end: 0,
            curve: Curves.easeOutCubic,
          ); // or your custom widget
    }).toList(),
  );
}
