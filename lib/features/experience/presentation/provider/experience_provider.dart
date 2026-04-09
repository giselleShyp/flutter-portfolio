import 'package:flutter/material.dart';
import 'package:my_portfolio/features/experience/domain/entities/experience_entity.dart';
import 'package:my_portfolio/features/experience/presentation/provider/experience_deps_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'experience_provider.g.dart';

@riverpod
class ExperienceController extends _$ExperienceController {
  @override
  Future<List<ExperienceEntity>> build() {
    try {
      final getExperiencesUseCase = ref.watch(getExperiencesUseCaseProvider);

      return getExperiencesUseCase.call();
    } catch (e) {
      debugPrint("ExperienceController Error : $e");
      throw "ExperienceController Error : $e";
    }
  }
}
