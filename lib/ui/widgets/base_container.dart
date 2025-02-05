import 'package:flutter/material.dart';

class BaseContainerWidget extends StatelessWidget {
  const BaseContainerWidget({
    super.key,
    this.width,
    this.margin,
    required this.child,
    this.padding = const EdgeInsets.all(8),
    this.containerColor,
    this.borderRadius,
  });

  final double? width;
  final EdgeInsets? margin;
  final Widget child;
  final EdgeInsets padding;
  final Color? containerColor;

  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: containerColor ?? theme.cardColor,
        borderRadius: borderRadius ?? BorderRadius.circular(16),
      ),
      child: child,
    );
  }
}
