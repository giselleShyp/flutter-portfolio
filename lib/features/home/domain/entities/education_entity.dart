class EducationEntity {
  final String title;
  final String institution;
  final DateTime startDate;
  final DateTime endDate;

  EducationEntity({
    required this.title,
    required this.institution,
    required this.startDate,
    required this.endDate,
  });

  String get period => "${startDate.year} – ${endDate.year}";
}
