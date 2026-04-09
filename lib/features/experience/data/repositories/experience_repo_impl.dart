import '../../domain/entities/experience_entity.dart';
import '../../domain/repositories/i_experience_repo.dart';
import '../datasources/experience_remote_datasource.dart';

class ExperienceRepoImpl implements IExperienceRepo {
  ExperienceRemoteDatasource remoteDatasource;

  ExperienceRepoImpl(this.remoteDatasource);

  @override
  Future<List<ExperienceEntity>> getExperiences() async {
    return await remoteDatasource.fetchExperiences();
  }
}
