import 'package:flutter/material.dart';

Widget buildButtonWidget(
    {required BuildContext context,
    required String label,
    required String assetPath,
    required VoidCallback onTap,
    required double fontSize,
    required Color textColor,
    required Color buttonColor}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    child: Material(
      color: buttonColor,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        splashColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        highlightColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(assetPath, scale: 8),
              const SizedBox(width: 12),
              Text(
                label,
                style: TextStyle(
                  color: textColor,
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
