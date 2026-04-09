import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/gaps.dart';
import 'package:my_portfolio/core/widgets/buttons/app_text_button.dart';
import 'package:my_portfolio/core/widgets/text/app_text.dart';

class ProjectEmptyState extends StatelessWidget {
  const ProjectEmptyState({
    super.key,
    required this.onReconnectingPressed,
    this.message = "No projects found matching this category.",
  });

  final String message;
  final VoidCallback onReconnectingPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        //mainAxisAlignment: MainValue.center,
        children: [
          Icon(
            Icons.layers_clear_outlined,
            size: 80,
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
          ),
          Gaps.h24,
          AppText(
            "No Projects",
            contentStyle: ContentStyle.titleLarge,
            fontWeight: FontWeight.bold,
          ),
          Gaps.h8,
          AppText(
            message,
            contentStyle: ContentStyle.bodyMedium,
            textAlign: TextAlign.center,
          ),
          Gaps.h32,
          AppTextButton(
            onPressed: onReconnectingPressed,
            child: AppText(
              "Try Reconnecting",
              contentStyle: ContentStyle.bodyLarge,
              contentColor: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
