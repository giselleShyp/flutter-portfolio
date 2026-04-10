import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_portfolio/core/layouts/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:my_portfolio/core/route/app_router.gr.dart';

@RoutePage()
class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        // This matches the background of your BottomNavigationBar
        systemNavigationBarColor: theme.surface, // Matches the Container above
        systemNavigationBarIconBrightness: theme.brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
      child: AutoTabsRouter(
        routes: const [
          HomeRoute(),
          SkillsRoute(),
          ExperienceRoute(),
          ProjectsRoute(),
        ],
        duration: Duration.zero,
        builder: (context, child) {
          final tabsRouter = context.tabsRouter;

          return Scaffold(
            body: child,
            extendBody: false,
            bottomNavigationBar: MainBottomNavigationBar(
              indexSelected: tabsRouter.activeIndex,
              onTap: (index) {
                onTabTapped(index, tabsRouter);
              },
              items: [
                BottomNavItem(icon: Icons.home_outlined, label: 'Home'),
                BottomNavItem(icon: Icons.code, label: 'Skills'),
                BottomNavItem(
                    icon: Icons.business_center_outlined,
                    label: 'Experience'), //Icons.work_outline,
                BottomNavItem(icon: Icons.layers_outlined, label: 'Projects'),
              ],
            ),
          );
        },
      ),
    );
  }

  void onTabTapped(int index, TabsRouter tabsRouter) {
    // AutoRoute handles the state and index switching internally.
    // No need for a switch statement!
    tabsRouter.setActiveIndex(index);
  }
}
