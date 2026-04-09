import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/gaps.dart';
import 'package:my_portfolio/core/widgets/text/app_text.dart';

class ExperienceErrorState extends StatelessWidget {
  const ExperienceErrorState({
    super.key,
    required this.error,
    required this.onRetry,
  });

  final String error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        children: [
          Icon(Icons.cloud_off_rounded,
              size: 48, color: theme.colorScheme.error),
          Gaps.h16,
          AppText("Unable to load Career History", fontWeight: FontWeight.bold),
          Gaps.h8,
          AppText(
            "We couldn't reach the server to fetch Giselle's experience.",
            contentStyle: ContentStyle.bodySmall,
          ),
          Gaps.h24,
          ElevatedButton(
            onPressed: onRetry,
            child: const Text(
              "Retry Connection",
            ),
          ),
        ],
      ),
    );
  }
}
