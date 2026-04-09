import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:url_launcher/url_launcher.dart';

part 'url_launcher_service.g.dart';

@riverpod
UrlLauncherService urlLauncherService(Ref ref) {
  return UrlLauncherService();
}

class UrlLauncherService {
  //Open External Url (Github , gmail, LinkedIn)
  Future<void> openUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    try {
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        throw 'Could not launch $urlString';
      }
    } catch (e) {
      debugPrint("Error launchUrl : $e");
      rethrow;
    }
  }

  // // For Send Email
  // Future<void> sendEmail(String email) async {
  //   final Uri emailLaunchUri = Uri(
  //     scheme: 'mailto',
  //     path: email,
  //   );
  //   await launchUrl(emailLaunchUri);
  // }
}
