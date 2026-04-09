import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/datasources/profile_remote_datasource.dart';
import '../../data/repositories/profile_repo_impl.dart';
import '../../domain/repositories/i_profile_repo.dart';
import '../../domain/usecases/get_profile_usecase.dart';

part 'profile_deps_provider.g.dart';

@riverpod
GetProfileUseCase getProfileUseCase(Ref ref) {
  final repository = ref.watch(profileRepositoryProvider);
  return GetProfileUseCase(repository);
}

@riverpod
IProfileRepository profileRepository(Ref ref) {
  final dataSource = ref.watch(profileDataSourceProvider);
  return ProfileRepositoryImpl(dataSource);
}

@riverpod
ProfileRemoteDatasource profileDataSource(Ref ref) {
  return ProfileRemoteDatasource();
}
