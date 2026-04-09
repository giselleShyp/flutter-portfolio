import 'package:flutter/material.dart';
import 'package:my_portfolio/features/projects/domain/entities/project_entity.dart';
import 'package:my_portfolio/features/projects/presentation/providers/projects_deps_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'projects_provider.g.dart';

@riverpod
class ProjectsController extends _$ProjectsController {
  @override
  Future<List<ProjectEntity>> build() async {
    try {
      final projectsUseCase = ref.watch(getProjectUseCaseProvider);

      return await projectsUseCase.call();
    } catch (e) {
      debugPrint("ProjectsController Error : $e");
      throw "ProjectsController Error : $e";
    }
  }
}
