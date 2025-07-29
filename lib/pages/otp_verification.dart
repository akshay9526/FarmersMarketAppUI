
import 'package:farmersmarket/constants/APpConstants.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'home_page.dart';
import 'login_page.dart';

class OTPVerification extends StatefulWidget {
  const OTPVerification({super.key});

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  final TextEditingController otpController = TextEditingController();

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  void verifyOtp() {
    final otp = otpController.text;
    if (otp.length == 6) {
      print("Verifying OTP: $otp");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppConstants.top_msg)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/otp_verify.jpg'),
              const SizedBox(height: 10),
              Text(
                AppConstants.otp_Verification,
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                AppConstants.otp_veri_msg,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).dividerColor,
                    ),
              ),
              Text(
                AppConstants.mobile_num,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).dividerColor,
                    ),
              ),
              const SizedBox(height: 10),
              PinCodeTextField(
                appContext: context,
                controller: otpController,
                length: 6,
                keyboardType: TextInputType.number,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor:
                      Theme.of(context).colorScheme.secondaryContainer,
                  selectedFillColor: Colors.grey.shade200,
                  inactiveFillColor: Theme.of(context).colorScheme.background,
                  activeColor: Colors.grey.shade300,
                  selectedColor: Colors.blueGrey,
                  inactiveColor: Colors.grey.shade400,
                ),
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                onCompleted: (_) => verifyOtp(),
                onChanged: (_) {},
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: buildAuthButton(
                  context: context,
                  assetPath: 'assets/verify.png',
                  label: AppConstants.verify_mob_num,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HomePage()));
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
