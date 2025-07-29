import 'package:flutter/material.dart';

Widget buildMultiTextField({
  required BuildContext context,
  required String label,
  required TextEditingController controller,
  int minLines = 4,
  int maxLines = 6,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: TextInputType.multiline,
    textInputAction: TextInputAction.newline,
    minLines: minLines,
    maxLines: maxLines,
    style: Theme.of(context).textTheme.bodyLarge,
    decoration: InputDecoration(
      labelText: label,
      alignLabelWithHint: true, // Important for multiline labels
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
    ),
    cursorColor: Colors.black,
  );
}
