import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/gaps.dart';
import 'package:my_portfolio/core/widgets/text/app_text.dart';

class SkillErrorState extends StatelessWidget {
  const SkillErrorState({
    super.key,
    this.errorMessage,
    required this.onRetry,
  });
  final String? errorMessage;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.terminal_rounded,
            size: 64,
            color: theme.colorScheme.error.withValues(alpha: 0.5),
          ),
          Gaps.h16,
          AppText(
            errorMessage ?? "Compilation Error: Skills not found",
            fontWeight: FontWeight.bold,
          ),
          Gaps.h8,
          AppText(
            "Check your connection and try again.",
            contentStyle: ContentStyle.bodySmall,
          ),
          Gaps.h24,
          OutlinedButton(
            onPressed: onRetry,
            child: const Text("Retry Connection"),
          ),
        ],
      ),
    );
  }
}
