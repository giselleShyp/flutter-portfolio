import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/app_sizes.dart';
import 'package:my_portfolio/core/constants/gaps.dart';
import 'package:my_portfolio/core/widgets/padding/app_padding.dart';
import 'package:my_portfolio/core/widgets/text/app_text.dart';

class HomeErrorState extends StatelessWidget {
  const HomeErrorState({
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.cloud_off_rounded,
              size: 64,
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
              child: const AppText(
                "Reconnect to Server",
                contentStyle: ContentStyle.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
