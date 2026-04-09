import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/certificate_entity.dart';

class CertificateModel extends CertificateEntity {
  CertificateModel({
    required super.name,
    required super.year,
  });

  factory CertificateModel.fromMap(Map<String, dynamic> map) {
    return CertificateModel(
      name: map['name'] as String? ?? '',
      year: (map['year'] as Timestamp).toDate(),
    );
  }
}
