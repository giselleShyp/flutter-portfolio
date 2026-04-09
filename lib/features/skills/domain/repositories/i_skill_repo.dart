import '../entities/skill_entity.dart';

abstract class ISkillRepository {
  Future<List<SkillEntity>> getSkills();
}
