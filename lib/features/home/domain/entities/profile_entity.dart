import 'education_entity.dart';
import 'certificate_entity.dart';
import 'language_entity.dart';

class ProfileEntity {
  final String name;
  final String role;
  final String phone;
  final String location;
  final String email;
  final String about;
  final Map<String, String> socialLinks;
  final List<EducationEntity> educations;
  final List<CertificateEntity> certifications;
  final List<LanguageEntity> languages;

  ProfileEntity({
    required this.name,
    required this.role,
    required this.phone,
    required this.location,
    required this.email,
    required this.about,
    required this.socialLinks,
    required this.educations,
    required this.certifications,
    required this.languages,
  });
}
