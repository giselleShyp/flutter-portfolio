import 'package:my_portfolio/features/experience/domain/entities/experience_entity.dart';

abstract class IExperienceRepo {
  Future<List<ExperienceEntity>> getExperiences();
}
