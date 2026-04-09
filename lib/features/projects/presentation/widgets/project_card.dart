import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/app_radius.dart';
import 'package:my_portfolio/core/constants/app_sizes.dart';
import 'package:my_portfolio/core/constants/gaps.dart';
import 'package:my_portfolio/core/widgets/buttons/app_text_button.dart';
import 'package:my_portfolio/core/widgets/text/app_text.dart';
import 'package:my_portfolio/features/projects/domain/entities/project_entity.dart';
import 'package:my_portfolio/features/projects/presentation/widgets/project_card_container.dart';
import 'package:my_portfolio/features/skills/presentation/widgets/skill_chip.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.technologies,
    required this.projectType,
    this.companyName,
    this.githubUrl,
  });

  final String title;
  final String description;
  final List<String> technologies;
  final ProjectType projectType;
  final String? companyName;
  final String? githubUrl;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;

    return ProjectCardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- Header: Icon + Title + Badge ---
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Square Blue Icon Container
              Container(
                padding: EdgeInsets.all(AppSize.s12.value),
                decoration: BoxDecoration(
                  color: primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppRadius.md),
                ),
                child: Icon(
                  Icons.folder_open_outlined,
                  color: primary,
                  //size: 24,
                ),
              ),
              Gaps.w16,
              // Title and Company
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      title,
                      contentStyle: ContentStyle.titleMedium,
                      fontWeight: FontWeight.bold,
                    ),
                    if (companyName != null) ...[
                      Gaps.h4,
                      AppText(
                        companyName!,
                        contentColor: primary,
                        contentStyle: ContentStyle.labelSmall,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                    Gaps.h16,

                    // --- Description ---
                    AppText(
                      description,
                      contentStyle: ContentStyle.bodySmall,
                      contentColor:
                          theme.colorScheme.onSurface.withValues(alpha: 0.7),
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
              _buildTypeBadge(context),
            ],
          ),

          Gaps.h24,

          // --- Tech Stack ---
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children:
                technologies.map((tech) => SkillChip(label: tech)).toList(),
          ),

          Gaps.h24,

          // --- Footer: Action Button ---
          if (githubUrl != null)
            InkWell(
              onTap: () {
                // Implement launch logic here
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppTextButton(
                    onPressed: () {},
                    child: AppText(
                      "View on GitHub",
                      contentStyle: ContentStyle.labelLarge,
                      contentColor: primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Gaps.w8,
                  Icon(
                    Icons.open_in_new_rounded,
                    size: 14,
                    color: primary,
                  ),
                ],
              ),
            )
          else
            AppText(
              "Private Repository",
              contentStyle: ContentStyle.labelSmall,
              contentColor:
                  theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
            ),
        ],
      ),
    );
  }

  Widget _buildTypeBadge(BuildContext context) {
    final isPublic = projectType == ProjectType.public;
    final color = isPublic
        ? Theme.of(context).colorScheme.secondary
        : Theme.of(context).colorScheme.primary;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.s8.value,
        vertical: AppSize.s4.value,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppRadius.sm),
      ),
      child: AppText(
        isPublic ? "Open Source" : "Work Project",
        contentStyle: ContentStyle.labelSmall,
        contentColor: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
