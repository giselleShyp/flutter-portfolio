import 'package:flutter/material.dart';

enum ContentStyle {
  bodyLarge,
  bodyMedium,
  bodySmall,
  displayLarge,
  displayMedium,
  displaySmall,
  labelLarge,
  labelMedium,
  labelSmall,
  headlineLarge,
  headlineMedium,
  headlineSmall,
  titleLarge,
  titleMedium,
  titleSmall,
}

class AppText extends StatelessWidget {
  const AppText(
    this.content, {
    super.key,
    this.contentStyle = ContentStyle.bodyLarge,
    this.fontSize,
    this.fontWeight,
    this.contentColor,
    this.overflow,
    this.textAlign,
    this.softWrap,
    this.letterSpacing,
    this.lineHeight,
    this.maxLines,
  });

  final String content;
  final ContentStyle contentStyle;
  final Color? contentColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final bool? softWrap;
  final double? letterSpacing;
  final double? lineHeight;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    // Use a Switch Expression for clean mapping
    final TextStyle baseStyle = switch (contentStyle) {
      ContentStyle.bodyLarge => theme.bodyLarge!,
      ContentStyle.bodyMedium => theme.bodyMedium!,
      ContentStyle.bodySmall => theme.bodySmall!,
      ContentStyle.displayLarge => theme.displayLarge!,
      ContentStyle.displayMedium => theme.displayMedium!,
      ContentStyle.displaySmall => theme.displaySmall!,
      ContentStyle.labelLarge => theme.labelLarge!,
      ContentStyle.labelMedium => theme.labelMedium!,
      ContentStyle.labelSmall => theme.labelSmall!,
      ContentStyle.headlineLarge => theme.headlineLarge!,
      ContentStyle.headlineMedium => theme.headlineMedium!,
      ContentStyle.headlineSmall => theme.headlineSmall!,
      ContentStyle.titleLarge => theme.titleLarge!,
      ContentStyle.titleMedium => theme.titleMedium!,
      ContentStyle.titleSmall => theme.titleSmall!,
    };

    return Text(
      content,
      softWrap: softWrap,
      overflow: overflow,
      textAlign: textAlign,
      maxLines: maxLines,
      style: baseStyle.copyWith(
        color: contentColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing ?? 0,
        height: lineHeight,
      ),
    );
  }
}
