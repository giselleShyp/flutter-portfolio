import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/profile_entity.dart';
import 'profile_deps_provider.dart';

part 'profile_provider.g.dart';

@riverpod
class ProfileController extends _$ProfileController {
  @override
  Future<ProfileEntity> build() async {
    try {
      final profileUseCase = ref.watch(getProfileUseCaseProvider);

      return await profileUseCase.call();
    } catch (e) {
      debugPrint("ProfileController Error : $e");
      throw "ProfileController Error : $e";
    }
  }
}
