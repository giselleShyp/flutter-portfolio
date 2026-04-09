import 'package:my_portfolio/features/projects/domain/entities/project_entity.dart';

import '../repositories/i_project_repo.dart';

class GetProjectUseCase {
  final IProjectRepository repository;

  GetProjectUseCase(this.repository);

  Future<List<ProjectEntity>> call() async {
    return await repository.getProjects();

    //return categories.where((cat) => cat.skills.isNotEmpty).toList();
  }
}
