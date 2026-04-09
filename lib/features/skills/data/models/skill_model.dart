import '../../domain/entities/skill_entity.dart';

class SkillModel extends SkillEntity {
  SkillModel({
    required super.title,
    required super.iconCode,
    required super.skills,
    required super.order,
  });

  factory SkillModel.fromMap(Map<String, dynamic> map) {
    int toInt(dynamic value) {
      if (value == null) return 0;
      if (value is num) return value.toInt();
      if (value is String) return int.tryParse(value) ?? 0;
      return 0;
    }

    return SkillModel(
      title: map['title'] as String? ?? '',
      iconCode: toInt(map['icon_code']),
      skills: List<String>.from(map['skills'] ?? []),
      order: toInt(map['order']),
    );
  }
}
