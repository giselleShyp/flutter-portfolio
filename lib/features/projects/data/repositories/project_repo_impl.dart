import 'package:my_portfolio/features/projects/domain/entities/project_entity.dart';
import 'package:my_portfolio/features/projects/domain/repositories/i_project_repo.dart';

import '../datasources/project_remote_datasource.dart';

class ProjectRepositoryImpl implements IProjectRepository {
  final ProjectRemoteDatasource remoteDatasource;

  ProjectRepositoryImpl(this.remoteDatasource);

  @override
  Future<List<ProjectEntity>> getProjects() async {
    return await remoteDatasource.fetchProjects();
  }
}
