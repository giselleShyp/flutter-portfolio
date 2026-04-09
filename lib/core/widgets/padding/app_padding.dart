import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/app_sizes.dart';

class AppPadding extends StatelessWidget {
  const AppPadding({
    super.key,
    this.child,
    this.all,
    this.x,
    this.y,
    this.top,
    this.right,
    this.bottom,
    this.left,
  });

  final Widget? child;
  final AppSize? all, x, y, top, bottom, right, left;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: top?.value ?? y?.value ?? all?.value ?? 0,
        bottom: bottom?.value ?? y?.value ?? all?.value ?? 0,
        left: left?.value ?? x?.value ?? all?.value ?? 0,
        right: right?.value ?? x?.value ?? all?.value ?? 0,
      ),
      child: child,
    );
  }
}
