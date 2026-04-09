// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:my_portfolio/core/layouts/base_page.dart' as _i1;
import 'package:my_portfolio/features/experience/presentation/screens/experience_screen.dart'
    as _i2;
import 'package:my_portfolio/features/home/presentation/screens/home_screen.dart'
    as _i3;
import 'package:my_portfolio/features/projects/presentation/screens/projects_screen.dart'
    as _i4;
import 'package:my_portfolio/features/skills/presentation/screens/skills_screen.dart'
    as _i5;

/// generated route for
/// [_i1.BasePage]
class BaseRoute extends _i6.PageRouteInfo<void> {
  const BaseRoute({List<_i6.PageRouteInfo>? children})
    : super(BaseRoute.name, initialChildren: children);

  static const String name = 'BaseRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i1.BasePage();
    },
  );
}

/// generated route for
/// [_i2.ExperienceScreen]
class ExperienceRoute extends _i6.PageRouteInfo<void> {
  const ExperienceRoute({List<_i6.PageRouteInfo>? children})
    : super(ExperienceRoute.name, initialChildren: children);

  static const String name = 'ExperienceRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.ExperienceScreen();
    },
  );
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomeScreen();
    },
  );
}

/// generated route for
/// [_i4.ProjectsScreen]
class ProjectsRoute extends _i6.PageRouteInfo<void> {
  const ProjectsRoute({List<_i6.PageRouteInfo>? children})
    : super(ProjectsRoute.name, initialChildren: children);

  static const String name = 'ProjectsRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.ProjectsScreen();
    },
  );
}

/// generated route for
/// [_i5.SkillsScreen]
class SkillsRoute extends _i6.PageRouteInfo<void> {
  const SkillsRoute({List<_i6.PageRouteInfo>? children})
    : super(SkillsRoute.name, initialChildren: children);

  static const String name = 'SkillsRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.SkillsScreen();
    },
  );
}
