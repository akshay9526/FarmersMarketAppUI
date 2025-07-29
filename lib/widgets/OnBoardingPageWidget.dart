
import 'package:farmersmarket/constants/APpConstants.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';

import '../models/onBoarding_model.dart';
import '../pages/login_page.dart';
import 'buildButtonWidget_without_icon.dart';

class OnBoardingPageWidget extends StatefulWidget {
  const OnBoardingPageWidget({
    super.key,
    required this.model,
    required this.isActive,
    required this.controller,
    required this.totalPages,
  });

  final OnBoardingModel model;
  final bool isActive;
  final LiquidController controller;
  final int totalPages;

  @override
  State<OnBoardingPageWidget> createState() => _OnBoardingPageWidgetState();
}

class _OnBoardingPageWidgetState extends State<OnBoardingPageWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slide;
  late Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _initAnimations();
  }

  void _initAnimations() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _slide = Tween<Offset>(
      begin: const Offset(0, 0.4),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fade = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    // Start animation if this is the first visible page
    if (widget.isActive) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(covariant OnBoardingPageWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isActive && !_controller.isAnimating) {
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = widget.model;

    return Container(
      color: model.index == 2 ? const Color(0xFFEDF6E5) : model.bgColor,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 40),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SlideTransition(
                  position: _slide,
                  child: FadeTransition(
                    opacity: _fade,
                    child: Image.asset(
                      model.image,
                      height: model.height * 0.4,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                SlideTransition(
                  position: _slide,
                  child: FadeTransition(
                    opacity: _fade,
                    child: Column(
                      children: [
                        Text(
                          model.title,
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.headlineSmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade700,
                                  ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          model.subTitle,
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey.shade500,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SlideTransition(
            position: _slide,
            child: FadeTransition(
              opacity: _fade,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: buildButtonWidgetWithoutIcon(
                  buttonColor:
                      Theme.of(context).colorScheme.onTertiaryContainer,
                  textColor: Theme.of(context).colorScheme.onTertiary,
                  context: context,
                  label: model.index == widget.totalPages - 1
                      ? AppConstants.get_started
                      : AppConstants.next,
                  fontSize: 18,
                  onTap: () {
                    if (model.index == widget.totalPages - 1) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginPage()),
                        (route) => false,
                      );
                    } else {
                      widget.controller.animateToPage(
                        page: model.index + 1,
                        duration: 500,
                      );
                    }
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
