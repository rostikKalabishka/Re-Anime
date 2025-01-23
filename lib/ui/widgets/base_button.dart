import 'package:flutter/material.dart';

class BaseButtonWidget extends StatelessWidget {
  const BaseButtonWidget(
      {super.key,
      required this.onPressed,
      required this.child,
      this.width,
      this.height});
  final void Function() onPressed;
  final Widget child;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(),
      width: width ?? double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(backgroundColor: theme.primaryColor),
        child: child,
      ),
    );
  }
}
