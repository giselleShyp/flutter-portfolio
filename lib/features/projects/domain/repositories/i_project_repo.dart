import 'package:my_portfolio/features/projects/domain/entities/project_entity.dart';

abstract class IProjectRepository {
  Future<List<ProjectEntity>> getProjects();
}
