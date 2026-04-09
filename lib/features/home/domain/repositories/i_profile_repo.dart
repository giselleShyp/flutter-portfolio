import '../entities/profile_entity.dart';

abstract class IProfileRepository {
  Future<ProfileEntity> getProfile();
}
