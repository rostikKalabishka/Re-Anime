import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ButtonAuthWidget extends StatelessWidget {
  const ButtonAuthWidget({
    super.key,
    required this.image,
    required this.onTap,
    required this.text,
    this.color,
    this.textColor,
    this.borderRadius,
  });
  final String image;
  final VoidCallback onTap;
  final String text;
  final Color? color;
  final Color? textColor;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(borderRadius ?? 32),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius ?? 32),
            color: color ?? theme.primaryColor),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              image,
              height: 28,
            ),
            const SizedBox(
              width: 7,
            ),
            Text(text,
                style: theme.textTheme.titleMedium?.copyWith(color: textColor))
          ],
        )),
      ),
    );
  }
}
