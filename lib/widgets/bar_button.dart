import 'package:flutter/material.dart';

class BarButton extends StatelessWidget {
  final String text;
  final bool isEnabled;
  final VoidCallback? onPressed;
  final Color enabledColor;
  final Color disabledColor;
  final Color enabledTextColor;
  final Color disabledTextColor;

  const BarButton({
    Key? key,
    required this.text,
    required this.isEnabled,
    this.onPressed,
    required this.enabledColor,
    required this.disabledColor,
    required this.enabledTextColor,
    required this.disabledTextColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled ? onPressed : null,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isEnabled ? enabledColor : disabledColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isEnabled ? enabledTextColor : disabledTextColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
