import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/app_radius.dart';
import 'package:my_portfolio/core/constants/app_sizes.dart';
import 'package:my_portfolio/core/constants/gaps.dart';
import 'package:my_portfolio/core/widgets/padding/app_padding.dart';
import 'package:my_portfolio/core/widgets/text/app_text.dart';

class ProjectErrorState extends StatelessWidget {
  const ProjectErrorState({
    super.key,
    required this.error,
    required this.onRetry,
  });

  final String error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppPadding(
        all: AppSize.s24,
        child: Container(
          padding: EdgeInsets.all(AppSize.s24.value),
          decoration: BoxDecoration(
            color: Theme.of(context)
                .colorScheme
                .errorContainer
                .withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(AppRadius.md),
            border: Border.all(
              color: Theme.of(context).colorScheme.error.withValues(alpha: 0.2),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.bug_report_outlined,
                color: Theme.of(context).colorScheme.error,
              ),
              Gaps.h12,
              AppText("Data Fetch Error", fontWeight: FontWeight.bold),
              Gaps.h8,
              AppText(
                error,
                contentStyle: ContentStyle.bodySmall,
                textAlign: TextAlign.center,
              ),
              Gaps.h24,
              ElevatedButton(
                onPressed: onRetry,
                child: const Text("Reconnect to Server"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
