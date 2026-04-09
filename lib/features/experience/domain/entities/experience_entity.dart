import 'package:intl/intl.dart';

class ExperienceEntity {
  ExperienceEntity({
    required this.role,
    required this.companyName,
    required this.descriptions,
    required this.startDate,
    this.endDate,
    this.isCurrent = false,
    this.isVolunteer = false,
    this.companyLogo,
  });

  final String role;
  final String companyName;
  final List<String> descriptions;
  final DateTime startDate;
  final String? companyLogo;
  final DateTime? endDate;
  final bool isCurrent;
  final bool isVolunteer;

  String get dateRange {
    final DateFormat formatter = DateFormat('MMM yyyy');

    String start = formatter.format(startDate);
    String end = isCurrent
        ? "Present"
        : (endDate != null ? formatter.format(endDate!) : "Present");

    // Calculate duration in months
    final DateTime endTarget =
        isCurrent ? DateTime.now() : (endDate ?? DateTime.now());
    final int months = ((endTarget.year - startDate.year) * 12) +
        (endTarget.month - startDate.month);

    String duration;
    if (months >= 12) {
      final int yrs = months ~/ 12;
      duration = "$yrs yr${yrs > 1 ? 's' : ''}";
    } else {
      duration = "$months mo${months > 1 ? 's' : ''}";
    }

    return "$start - $end · $duration";
  }
}
