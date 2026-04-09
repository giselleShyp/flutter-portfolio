import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/gaps.dart';
import 'package:my_portfolio/core/widgets/buttons/app_button.dart';

class SocialActionButtons extends StatelessWidget {
  const SocialActionButtons({
    super.key,
    required this.onLinkedInPressed,
    required this.onGitHubPressed,
    required this.onEmailPressed,
  });

  final VoidCallback onLinkedInPressed;
  final VoidCallback onGitHubPressed;
  final VoidCallback onEmailPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: AppButton(
                variation: ButtonVariation.secondary,
                buttonType: ButtonType.linkedIn,
                onPressed: onLinkedInPressed,
              ),
            ),
            Gaps.w12,
            Expanded(
              child: AppButton(
                variation: ButtonVariation.secondary,
                buttonType: ButtonType.github,
                isFullWidth: true,
                onPressed: onGitHubPressed,
              ),
            ),
          ],
        ),
        Gaps.h12,
        AppButton(
          variation: ButtonVariation.primary,
          buttonType: ButtonType.email,
          onPressed: onEmailPressed,
        ),
      ],
    );
  }
}
