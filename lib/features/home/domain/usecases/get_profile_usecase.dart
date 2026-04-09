import '../entities/profile_entity.dart';
import '../repositories/i_profile_repo.dart';

class GetProfileUseCase {
  final IProfileRepository repository;

  GetProfileUseCase(this.repository);

  Future<ProfileEntity> call() async {
    return await repository.getProfile();
  }
}
