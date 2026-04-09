import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/core/constants/app_sizes.dart';
import 'package:my_portfolio/core/constants/gaps.dart';
import 'package:my_portfolio/core/widgets/buttons/app_text_button.dart';
import 'package:my_portfolio/core/widgets/text/app_text.dart';

enum ContactType {
  email(FontAwesomeIcons.envelope),
  phoneNumber(CupertinoIcons.phone),
  location(CupertinoIcons.placemark);

  final IconData icon;
  const ContactType(this.icon);
}

class ContactInfoWidget extends StatelessWidget {
  const ContactInfoWidget({
    super.key,
    required this.contactType,
    required this.info,
    this.onPressed,
  });

  final ContactType contactType;
  final String info;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    ColorScheme theme = Theme.of(context).colorScheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          contactType.icon,
          size: AppSize.s16.value,
          color: theme.primary,
        ),
        Gaps.w8,
        AppTextButton(
          onPressed: onPressed,
          child: AppText(
            info,
            contentStyle: ContentStyle.labelLarge,
            contentColor: theme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
