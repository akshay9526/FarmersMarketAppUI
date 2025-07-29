
import 'package:farmersmarket/constants/APpConstants.dart';
import 'package:farmersmarket/pages/phone_verification.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              Image.asset(
                'assets/2.jpg',
                width: 380,
              ),
              Text(AppConstants.appName,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold)),
              Text(AppConstants.login_msg,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).dividerColor,
                      fontWeight: FontWeight.normal)),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: buildAuthButton(
                  context: context,
                  assetPath: 'assets/google_icon.png',
                  label: AppConstants.cnt_with_google,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HomePage()));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: buildAuthButton(
                  context: context,
                  assetPath: 'assets/phone_icon.png',
                  label: AppConstants.cnt_with_phone,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PhoneVerification()));
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

Widget buildAuthButton({
  required BuildContext context,
  required String assetPath,
  required String label,
  required VoidCallback onTap,
}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    child: Material(
      color: Theme.of(context).colorScheme.secondaryContainer,
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
                  color: Theme.of(context).primaryColor,
                  fontSize: 16,
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
