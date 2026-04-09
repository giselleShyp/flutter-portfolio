import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/features/projects/data/datasources/project_remote_datasource.dart';
import 'package:my_portfolio/features/projects/data/repositories/project_repo_impl.dart';
import 'package:my_portfolio/features/projects/domain/repositories/i_project_repo.dart';
import 'package:my_portfolio/features/projects/domain/usecases/get_project_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'projects_deps_provider.g.dart';

@riverpod
GetProjectUseCase getProjectUseCase(Ref ref) {
  final repository = ref.watch(projectsRepositoryProvider);
  return GetProjectUseCase(repository);
}

@riverpod
IProjectRepository projectsRepository(Ref ref) {
  final dataSource = ref.watch(projectsDataSourceProvider);
  return ProjectRepositoryImpl(dataSource);
}

@riverpod
ProjectRemoteDatasource projectsDataSource(Ref ref) {
  return ProjectRemoteDatasource();
}
