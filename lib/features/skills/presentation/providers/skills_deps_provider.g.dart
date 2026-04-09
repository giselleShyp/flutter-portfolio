// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skills_deps_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$skillsDataSourceHash() => r'ef976d61606a0c60cac09b9b6ed1a6a352502b60';

/// See also [skillsDataSource].
@ProviderFor(skillsDataSource)
final skillsDataSourceProvider =
    AutoDisposeProvider<SkillRemoteDataSource>.internal(
  skillsDataSource,
  name: r'skillsDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$skillsDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SkillsDataSourceRef = AutoDisposeProviderRef<SkillRemoteDataSource>;
String _$skillRepositoryHash() => r'cf778a121085827307a75749a6ef659b553bc2f0';

/// See also [skillRepository].
@ProviderFor(skillRepository)
final skillRepositoryProvider = AutoDisposeProvider<ISkillRepository>.internal(
  skillRepository,
  name: r'skillRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$skillRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SkillRepositoryRef = AutoDisposeProviderRef<ISkillRepository>;
String _$getSkillUseCaseHash() => r'e739c1619fd0bdc7ffd3c77b2a13320c95dee9f8';

/// See also [getSkillUseCase].
@ProviderFor(getSkillUseCase)
final getSkillUseCaseProvider =
    AutoDisposeProvider<GetSkillCategoriesUseCase>.internal(
  getSkillUseCase,
  name: r'getSkillUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getSkillUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetSkillUseCaseRef = AutoDisposeProviderRef<GetSkillCategoriesUseCase>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
