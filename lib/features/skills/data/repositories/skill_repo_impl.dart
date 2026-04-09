import '../../domain/entities/skill_entity.dart';
import '../../domain/repositories/i_skill_repo.dart';
import '../datasources/skill_remote_datasource.dart';

class SkillRepositoryImpl implements ISkillRepository {
  final SkillRemoteDataSource remoteDataSource;

  SkillRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<SkillEntity>> getSkills() async {
    return await remoteDataSource.fetchSkills();
  }
}
