import 'package:farmersmarket/constants/APpConstants.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

Widget buildPhoneInput({required BuildContext context}) {
  return SizedBox(
    height: 80,
    child: IntlPhoneField(
      decoration: InputDecoration(
        labelText: AppConstants.phone_number,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.secondaryContainer,
      ),
      initialCountryCode: 'IN',
      onChanged: (phone) {},
      onCountryChanged: (country) {},
    ),
  );
}
