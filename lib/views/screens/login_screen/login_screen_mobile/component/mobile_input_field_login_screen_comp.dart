import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../../../../../constants/border.dart';

class MobileInputFieldLoginScreenComp extends StatelessWidget {
  const MobileInputFieldLoginScreenComp(
    this._phoneNumberController, {
    super.key,
  });

  final TextEditingController _phoneNumberController;
  static late String? phoneNumber;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: _phoneNumberController,
      validator: (PhoneNumber? phoneNum) async {
        phoneNumber = phoneNum?.completeNumber;
      },
      onCountryChanged: (Country country) {
        phoneNumber = null;
      },
      initialCountryCode: 'GB',
      decoration: InputDecoration(
        labelText: 'Mobile number',
        border: OutlineInputBorder(
          borderRadius: circular8,
        ),
      ),
    );
  }
}
