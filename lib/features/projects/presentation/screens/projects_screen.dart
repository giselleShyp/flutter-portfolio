import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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
    children: projectsList.map((project) {
      return ProjectCard(
        title: project.title,
        description: project.description,
        technologies: project.technologies,
        projectType: project.type,
        githubUrl: project.githubUrl,
      ); // or your custom widget
    }).toList(),
  );
}

      // ProjectCard(
      //     project: ProjectEntity(
      //       title: "Sawa Health",
      //       description:
      //           "Cross-platform shipping and logistics mobile application",
      //       technologies: ["Flutter", "Dart"],
      //       companyName: "Shyp studio",
      //       type: ProjectType.private,
      //     ),
      //   ),
      //   Gaps.h12,
      //   ProjectCard(
      //     project: ProjectEntity(
      //       title: "Resto chine",
      //       description: "description",
      //       technologies: ["flutter", "dart", "Git"],
      //       type: ProjectType.public,
      //       githubUrl: "dmnsbfd",
      //     ),
      //   ),
      //   Gaps.h12,
      //   ProjectCard(
      //     project: ProjectEntity(
      //       title: "title",
      //       description: "description",
      //       technologies: ["technologies"],
      //       type: ProjectType.work,
      //     ),
      //   ),
