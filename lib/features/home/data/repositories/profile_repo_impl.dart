import '../../domain/entities/profile_entity.dart';
import '../../domain/repositories/i_profile_repo.dart';
import '../datasources/profile_remote_datasource.dart';

class ProfileRepositoryImpl implements IProfileRepository {
  final ProfileRemoteDatasource remoteDatasource;

  ProfileRepositoryImpl(this.remoteDatasource);

  @override
  Future<ProfileEntity> getProfile() async {
    return await remoteDatasource.fetchProfile();
  }
}
