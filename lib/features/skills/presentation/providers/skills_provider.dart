import 'package:flutter/material.dart';
import 'package:my_portfolio/features/skills/presentation/providers/skills_deps_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/skill_entity.dart';

part 'skills_provider.g.dart';

@riverpod
class SkillsController extends _$SkillsController {
  @override
  Future<List<SkillEntity>> build() async {
    try {
      final getSkillsResult = ref.watch(getSkillUseCaseProvider);

      return await getSkillsResult.call();
    } catch (e) {
      debugPrint("Error in SkillsController: $e");
      throw "Error in SkillsController: $e";
    }
  }
}
