import '../../domain/entities/profile_entity.dart';
import 'education_model.dart';
import 'certificate_model.dart';
import 'language_model.dart';

class ProfileModel extends ProfileEntity {
  ProfileModel({
    required super.name,
    required super.role,
    required super.phone,
    required super.location,
    required super.email,
    required super.about,
    required super.socialLinks,
    required super.educations,
    required super.certifications,
    required super.languages,
  });

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      name: map['name'] as String? ?? '',
      role: map['role'] as String? ?? '',
      phone: map['phone'] as String? ?? '',
      location: map['location'] as String? ?? '',
      email: map['email'] as String? ?? '',
      about: map['about'] as String? ?? '',
      socialLinks: Map<String, String>.from(map['socialLinks'] ?? {}),
      educations: (map['educations'] as List? ?? [])
          .map((e) => EducationModel.fromMap(e as Map<String, dynamic>))
          .toList(),
      certifications: (map['certifications'] as List? ?? [])
          .map((c) => CertificateModel.fromMap(c as Map<String, dynamic>))
          .toList(),
      languages: (map['languages'] as List? ?? [])
          .map((l) => LanguageModel.fromMap(l as Map<String, dynamic>))
          .toList(),
    );
  }
}
