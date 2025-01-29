import 'package:flutter/material.dart';

class DefaultTextWidget extends StatelessWidget {
  const DefaultTextWidget({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: theme.textTheme.titleMedium,
      ),
    );
  }
}
