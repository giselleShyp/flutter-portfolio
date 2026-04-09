import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/experience_entity.dart';

class ExperienceModel extends ExperienceEntity {
  ExperienceModel({
    required super.role,
    required super.companyName,
    required super.startDate,
    required super.descriptions,
    super.endDate,
    super.companyLogo,
    super.isCurrent,
    super.isVolunteer,
  });

  factory ExperienceModel.fromMap(Map<String, dynamic> map) {
    return ExperienceModel(
      role: map['role'] ?? '',
      companyName: map['company_name'] ?? '',
      companyLogo: map['company_logo'] ?? '',
      isVolunteer: map['is_volunteer'] as bool? ?? false,
      startDate: (map['start_date'] as Timestamp).toDate(),
      endDate: map['end_date'] != null
          ? (map['end_date'] as Timestamp).toDate()
          : null,
      descriptions: (map['descriptions'] as List? ?? [])
          .map((e) => e.toString())
          .toList(),
      isCurrent: map['is_current'] as bool? ?? false,
    );
  }
}
