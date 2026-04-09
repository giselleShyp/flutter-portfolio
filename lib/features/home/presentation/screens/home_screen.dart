import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/core/constants/gaps.dart';
import 'package:my_portfolio/core/layouts/main_layout.dart';
import 'package:my_portfolio/core/services/url_launcher_service.dart';
import 'package:my_portfolio/features/home/presentation/widgets/info_card/profile_summary_card.dart';
import 'package:my_portfolio/features/home/domain/entities/profile_entity.dart';
import 'package:my_portfolio/features/home/presentation/providers/profile_provider.dart';
import 'package:my_portfolio/features/home/presentation/widgets/social_action_buttons.dart';
import 'package:my_portfolio/features/home/presentation/widgets/profile_header.dart';
import 'package:my_portfolio/features/home/presentation/widgets/state/home_error_state.dart';
import 'package:my_portfolio/features/home/presentation/widgets/state/home_loading_state.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final profile = ref.watch(profileControllerProvider);

    return MainLayout(
      children: [
        profile.when(
          loading: () => const HomeLoadingState(),
          error: (e, _) => HomeErrorState(
            error: e.toString(),
            onRetry: () => ref.invalidate(profileControllerProvider),
          ),
          data: (profileData) => _buildBody(profileData, ref),
        ),
      ],
    );
  }
}

Widget _buildBody(ProfileEntity profile, WidgetRef ref) {
  final urlService = ref.read(urlLauncherServiceProvider);

  return Column(
    children: [
      ProfileHeader(
        name: profile.name,
        role: profile.role,
        phoneNumber: profile.phone,
        location: profile.location,
        email: profile.email,
      ),
      Gaps.h24,
      SocialActionButtons(
        onLinkedInPressed: () {
          final url = profile.socialLinks['linkedin'];
          debugPrint("LinkedIn Url :$url");
          if (url != null) urlService.openUrl(url);
        },
        onGitHubPressed: () {
          final url = profile.socialLinks['github'];
          if (url != null) urlService.openUrl(url);
        },
        onEmailPressed: () {
          // For emails, you can use the 'mailto' scheme
          urlService.openUrl('mailto:${profile.email}');
        },
      ),
      Gaps.h24,
      ProfileSummaryCard(
        about: profile.about,
        educations: profile.educations,
        certifications: profile.certifications,
        languages: profile.languages,
      )
    ],
  );
}
