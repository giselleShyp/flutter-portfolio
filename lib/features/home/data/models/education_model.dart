import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/education_entity.dart';

class EducationModel extends EducationEntity {
  EducationModel({
    required super.title,
    required super.institution,
    required super.startDate,
    required super.endDate,
  });

  factory EducationModel.fromMap(Map<String, dynamic> map) {
    return EducationModel(
      title: map['title'] as String? ?? '',
      institution: map['institution'] as String? ?? '',
      startDate: (map['start_date'] as Timestamp).toDate(),
      endDate: (map['end_date'] as Timestamp).toDate(),
    );
  }
}
