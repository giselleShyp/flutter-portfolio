class CertificateEntity {
  final String name;
  final DateTime year;

  CertificateEntity({
    required this.name,
    required this.year,
  });
  String get yearString => year.year.toString();
}
