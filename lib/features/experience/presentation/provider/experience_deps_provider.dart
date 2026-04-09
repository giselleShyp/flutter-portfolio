import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/features/experience/data/datasources/experience_remote_datasource.dart';
import 'package:my_portfolio/features/experience/data/repositories/experience_repo_impl.dart';
import 'package:my_portfolio/features/experience/domain/repositories/i_experience_repo.dart';
import 'package:my_portfolio/features/experience/domain/usecases/get_experiences_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'experience_deps_provider.g.dart';

@riverpod
GetExperiencesUseCase getExperiencesUseCase(Ref ref) {
  final repository = ref.watch(experienceRepoProvider);
  return GetExperiencesUseCase(repository);
}

@riverpod
IExperienceRepo experienceRepo(Ref ref) {
  final remoteDatasource = ref.watch(experienceRemoteDatasourceProvider);
  return ExperienceRepoImpl(remoteDatasource);
}

@riverpod
ExperienceRemoteDatasource experienceRemoteDatasource(Ref ref) {
  return ExperienceRemoteDatasource();
}
