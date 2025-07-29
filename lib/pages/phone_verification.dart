
import 'package:farmersmarket/constants/APpConstants.dart';
import 'package:flutter/material.dart';

import '../widgets/buildPhoneInputCode.dart';
import 'login_page.dart';
import 'otp_verification.dart';

class PhoneVerification extends StatelessWidget {
  PhoneVerification({super.key});

  final TextEditingController phoneNumController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/mobile_login.png'),
              Text(
                AppConstants.phone_verification,
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                AppConstants.phn_Veri_msg,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).dividerColor,
                    fontWeight: FontWeight.normal),
              ),
              Text(
                AppConstants.started,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).dividerColor,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: buildPhoneInput(context: context),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: buildAuthButton(
                  context: context,
                  assetPath: 'assets/message.png',
                  label: AppConstants.send_the_code,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const OTPVerification()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
