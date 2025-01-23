// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BaseContainerWidget extends StatelessWidget {
  const BaseContainerWidget({
    Key? key,
    this.width,
    this.margin,
    required this.child,
    this.padding = const EdgeInsets.all(8),
    this.containerColor,
    this.borderRadius,
  }) : super(key: key);

  final double? width;
  final EdgeInsets? margin;
  final Widget child;
  final EdgeInsets padding;
  final Color? containerColor;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: containerColor ?? theme.cardColor,
        borderRadius: BorderRadius.circular(borderRadius ?? 16),
      ),
      child: child,
    );
  }
}
