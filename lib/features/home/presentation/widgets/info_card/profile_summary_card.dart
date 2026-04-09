import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/app_sizes.dart';
import 'package:my_portfolio/core/constants/gaps.dart';
import 'package:my_portfolio/core/widgets/base_card/base_card.dart';
import 'package:my_portfolio/features/home/presentation/widgets/info_card/summary_item.dart';
import 'package:my_portfolio/features/home/presentation/widgets/info_card/language_item.dart';
import 'package:my_portfolio/features/home/presentation/widgets/info_card/summary_section.dart';
import 'package:my_portfolio/core/widgets/padding/app_padding.dart';
import 'package:my_portfolio/core/widgets/text/app_text.dart';
import 'package:my_portfolio/features/home/domain/entities/certificate_entity.dart';
import 'package:my_portfolio/features/home/domain/entities/education_entity.dart';
import 'package:my_portfolio/features/home/domain/entities/language_entity.dart';

class ProfileSummaryCard extends StatelessWidget {
  const ProfileSummaryCard({
    super.key,
    required this.about,
    required this.educations,
    required this.certifications,
    required this.languages,
  });

  final String about;
  final List<EducationEntity> educations;
  final List<CertificateEntity> certifications;
  final List<LanguageEntity> languages;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      padding: AppSize.s24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            about,
            contentStyle: ContentStyle.bodyMedium,
            fontWeight: FontWeight.w600,
            lineHeight: 1.5,
          ),

          // Gaps.h16,
          // const Divider(),
          // Gaps.h16,

          // --- Education Section ---
          if (educations.isNotEmpty) ...[
            _buildDivider(),
            SummarySection(
              icon: Icons.school_outlined,
              title: "EDUCATION",
              children: educations.asMap().entries.map((entry) {
                final index = entry.key;
                final e = entry.value;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SummaryItem(
                      title: e.title,
                      subtitle: e.institution,
                      description: e.period,
                    ),
                    // Add space ONLY if it's not the last item in this section
                    if (index != educations.length - 1) Gaps.h16,
                  ],
                );
              }).toList(),
            ),
          ],

          // --- Certifications Section ---
          if (certifications.isNotEmpty) ...[
            _buildDivider(),
            SummarySection(
              icon: Icons.workspace_premium_outlined,
              title: "CERTIFICATIONS",
              children: certifications.asMap().entries.map((entry) {
                final index = entry.key;
                final c = entry.value;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SummaryItem(
                      title: c.name,
                      description: c.yearString,
                    ),
                    // Add space ONLY if it's not the last item in this section
                    if (index != certifications.length - 1) Gaps.h16,
                  ],
                );
              }).toList(),
            ),
          ],

          // --- Languages Section ---
          if (languages.isNotEmpty) ...[
            _buildDivider(),
            SummarySection(
              icon: Icons.language_outlined,
              title: "LANGUAGES",
              children: languages
                  .map((l) => LanguageItem(name: l.name, level: l.level))
                  .toList(),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return const AppPadding(
      y: AppSize.s20,
      child: Divider(height: 1),
    );
  }
}
