import '../../domain/entities/language_entity.dart';

class LanguageModel extends LanguageEntity {
  LanguageModel({
    required super.name,
    required super.level,
  });

  factory LanguageModel.fromMap(Map<String, dynamic> map) {
    return LanguageModel(
      name: map['name'] as String? ?? '',
      level: map['level'] as String? ?? '',
    );
  }
}
