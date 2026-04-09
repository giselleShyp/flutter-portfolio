import '../entities/skill_entity.dart';
import '../repositories/i_skill_repo.dart';

class GetSkillCategoriesUseCase {
  final ISkillRepository repository;

  GetSkillCategoriesUseCase(this.repository);

  // We use "call" so we can execute the usecase like a function: useCase()
  Future<List<SkillEntity>> call() async {
    // This is where you would add business logic.
    // Example: Filtering out categories that have 0 skills.
    final categories = await repository.getSkills();

    return categories.where((cat) => cat.skills.isNotEmpty).toList();
  }
}
