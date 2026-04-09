import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/core/providers/theme_provider.dart';

class ThemeSwitcherButton extends ConsumerWidget {
  const ThemeSwitcherButton({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final themeMode = ref.watch(themeControllerProvider);
    final isDark = themeMode == ThemeMode.dark;

    return IconButton(
      onPressed: () {
        ref.read(themeControllerProvider.notifier).toggleTheme(!isDark);
      },
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        transitionBuilder: (child, anim) => RotationTransition(
          turns: anim,
          child: ScaleTransition(scale: anim, child: child),
        ),
        child: Icon(
          key: ValueKey(isDark),
          isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,

          //color: isDark ? Colors.amber[400] : Colors.orange[600],
        ),
      ),
    );
  }
}
