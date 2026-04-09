import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_portfolio/core/constants/app_radius.dart';
import 'package:my_portfolio/core/constants/app_sizes.dart';
import 'package:my_portfolio/core/constants/gaps.dart';
import 'package:my_portfolio/core/widgets/padding/app_padding.dart';
import 'package:my_portfolio/core/widgets/text/app_text.dart';

class BottomNavItem {
  final IconData icon;
  final String label;

  BottomNavItem({
    required this.icon,
    required this.label,
  });
}

class MainBottomNavigationBar extends StatelessWidget {
  const MainBottomNavigationBar({
    super.key,
    required this.indexSelected,
    required this.onTap,
    required this.items,
  });

  final int indexSelected;
  final List<BottomNavItem> items;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    ColorScheme theme = Theme.of(context).colorScheme;

    return SafeArea(
      child: Card(
        margin: EdgeInsets.zero,
        shape: Border(
          top: BorderSide(
            color: theme.outline,
            width: 1,
          ),
        ),
        child: AppPadding(
          x: AppSize.s16,
          y: AppSize.s12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              items.length,
              (index) => Builder(
                builder: (context) {
                  return buildBottomNavItem(
                    context,
                    icon: items[index].icon,
                    label: items[index].label,
                    isSelected: indexSelected == index,
                    onTap: () {
                      onTap(index);
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildBottomNavItem(
  BuildContext context, {
  IconData icon = Icons.home,
  required String label,
  required bool isSelected,
  required VoidCallback onTap,
}) {
  final theme = Theme.of(context);
  final Color activeColor = theme.colorScheme.primary;
  final Color inactiveColor =
      theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.6);

  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(AppRadius.lg),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: AppSize.s12.value),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: EdgeInsets.all(AppSize.s4.value),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // Only show glow when selected
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: activeColor.withValues(alpha: 0.4),
                        blurRadius: 15,
                        spreadRadius: 2,
                      )
                    ]
                  : [],
            ),
            child: Icon(
              icon,
              color: isSelected ? activeColor : inactiveColor,
              size: 26,
            ),
          ),
          // A small dot indicator below the icon
          Gaps.h4,
          AppText(
            label,
            contentStyle: ContentStyle.labelSmall,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            contentColor: isSelected ? activeColor : inactiveColor,
          ),
        ],
      ),
    ),
  );
}
