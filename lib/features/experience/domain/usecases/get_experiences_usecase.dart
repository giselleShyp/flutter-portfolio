import '../entities/experience_entity.dart';
import '../repositories/i_experience_repo.dart';

class GetExperiencesUseCase {
  IExperienceRepo repository;

  GetExperiencesUseCase(this.repository);

  Future<List<ExperienceEntity>> call() async {
    return await repository.getExperiences();
  }
}
