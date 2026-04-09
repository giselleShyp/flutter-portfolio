import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/core/constants/app_sizes.dart';
import 'package:my_portfolio/core/constants/gaps.dart';
import 'package:my_portfolio/core/widgets/text/app_text.dart';

enum ButtonVariation { primary, secondary }

enum ButtonType {
  email("Email", FontAwesomeIcons.envelope),
  github("GitHub", FontAwesomeIcons.github),
  linkedIn("LinkedIn", FontAwesomeIcons.linkedinIn);

  final String label;
  final IconData icon;
  const ButtonType(this.label, this.icon);
}

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.variation,
    required this.buttonType,
    required this.onPressed,
    this.isFullWidth = false,
  });

  final ButtonVariation variation;
  final ButtonType buttonType;
  final VoidCallback onPressed;
  final bool isFullWidth;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final Color contentColor = variation == ButtonVariation.primary
        ? theme.colorScheme.onPrimary
        : theme.colorScheme.onSurface;

    final Widget content = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          buttonType.icon,
          size: AppSize.s20.value,
          color: contentColor,
        ),
        Gaps.w8,
        AppText(
          buttonType.label,
          fontWeight: FontWeight.w600,
          contentColor: contentColor,
        ),
      ],
    );

    return variation == ButtonVariation.primary
        ? ElevatedButton(
            onPressed: onPressed,
            child: content,
          )
        : OutlinedButton(
            onPressed: onPressed,
            child: content,
          );
  }
}
