import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/app_sizes.dart';
import 'package:my_portfolio/core/constants/gaps.dart';
import 'package:my_portfolio/core/widgets/buttons/theme_switcher_button.dart';
import 'package:my_portfolio/core/widgets/text/app_text.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({
    super.key,
    this.pageHeaderTitle,
    required this.children,
  });

  final String? pageHeaderTitle;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          shape: Border(
            bottom: BorderSide(
              color: Theme.of(context).colorScheme.outline,
              width: 1,
            ),
          ),
          centerTitle: false,
          titleSpacing: AppSize.s20.value,
          actionsPadding: EdgeInsets.symmetric(horizontal: AppSize.s8.value),
          title: AppText(
            "Portfolio",
            contentStyle: ContentStyle.titleMedium, // Smaller, subtle app brand
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
          actions: [
            ThemeSwitcherButton(),
          ],
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.s20.value,
            vertical: AppSize.s24.value,
          ),
          children: [
            if (pageHeaderTitle != null) ...[
              AppText(
                pageHeaderTitle!,
                contentStyle: ContentStyle.headlineSmall,
                fontWeight: FontWeight.bold,
              ),
              Gaps.h24, // Space between title and content
            ],
            ...children,
          ],
        ),
      ),
    );
  }
}
