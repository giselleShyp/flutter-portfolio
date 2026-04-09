import 'package:auto_route/auto_route.dart';
import 'package:my_portfolio/core/route/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    // --- The Dashboard Shell (with Bottom Nav) ---
    AutoRoute(
      path: '/',
      page: BaseRoute.page,
      children: [
        AutoRoute(path: 'home', page: HomeRoute.page, initial: true),
        AutoRoute(path: 'skills', page: SkillsRoute.page),
        AutoRoute(path: 'experience', page: ExperienceRoute.page),
        AutoRoute(path: 'projects', page: ProjectsRoute.page),
        //  AutoRoute(path: 'contact', page: ContactRoute.page),
      ],
    ),
  ];
}
