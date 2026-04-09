import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/app_sizes.dart';
import 'package:my_portfolio/core/constants/gaps.dart';
import 'package:my_portfolio/core/widgets/contact_Info/contact_info_widget.dart';
import 'package:my_portfolio/core/widgets/text/app_text.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.name,
    required this.role,
    required this.phoneNumber,
    required this.location,
    required this.email,
  });

  final String name;
  final String role;
  final String phoneNumber;
  final String location;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        // spacing: AppSize.s8.value,
        children: [
          AppText(
            name,
            contentStyle: ContentStyle.headlineMedium,
            fontWeight: FontWeight.w600,
          ),
          Gaps.h8,
          AppText(
            role,
            contentStyle: ContentStyle.bodyLarge,
            contentColor: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.center,
          ),
          Gaps.h12,
          Column(
            spacing: AppSize.s4.value,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ContactInfoWidget(
                    contactType: ContactType.location,
                    info: location,
                  ),
                  Gaps.w16,
                  ContactInfoWidget(
                    contactType: ContactType.phoneNumber,
                    info: phoneNumber,
                  ),
                ],
              ),
              ContactInfoWidget(
                contactType: ContactType.email,
                info: email,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
