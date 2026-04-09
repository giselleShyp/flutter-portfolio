import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/features/skills/data/datasources/skill_remote_datasource.dart';
import 'package:my_portfolio/features/skills/data/repositories/skill_repo_impl.dart';
import 'package:my_portfolio/features/skills/domain/repositories/i_skill_repo.dart';
import 'package:my_portfolio/features/skills/domain/usecases/get_skill_categories_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'skills_deps_provider.g.dart';

@riverpod
SkillRemoteDataSource skillsDataSource(Ref ref) {
  return SkillRemoteDataSource();
}

@riverpod
ISkillRepository skillRepository(Ref ref) {
  final dataSource = ref.watch(skillsDataSourceProvider);
  return SkillRepositoryImpl(dataSource);
}

@riverpod
GetSkillCategoriesUseCase getSkillUseCase(Ref ref) {
  final repository = ref.watch(skillRepositoryProvider);
  return GetSkillCategoriesUseCase(repository);
}
