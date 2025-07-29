import 'package:flutter/material.dart';

Widget buildDropdownField<T>({
  required BuildContext context,
  required String label,
  required T? value,
  required List<T> items,
  required void Function(T?) onChanged,
  String Function(T)? itemLabelBuilder,
  String? Function(T?)? validator,
}) {
  return DropdownButtonFormField<T>(
    value: value,
    onChanged: onChanged,
    validator: validator,
    decoration: InputDecoration(
      labelText: label,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
    ),
    items: items.map((T item) {
      return DropdownMenuItem<T>(
        value: item,
        child: Text(itemLabelBuilder != null
            ? itemLabelBuilder(item)
            : item.toString()),
      );
    }).toList(),
    style: Theme.of(context).textTheme.bodyLarge,
    dropdownColor: Theme.of(context).colorScheme.secondaryContainer,
  );
}
