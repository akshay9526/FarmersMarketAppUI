
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../constants/imageurls.dart';
import '../constants/AppConstants.dart';
import '../models/onBoarding_model.dart';
import '../widgets/OnBoardingPageWidget.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = LiquidController();

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final pages = [
      OnBoardingPageWidget(
        model: OnBoardingModel(
          onBoardingImage1,
          AppConstants.onBoardingTitle1,
          AppConstants.onBoardingSubTitle1,
          const Color(0xFFF5F5DC),
          size.height,
          0,
        ),
        isActive: currentPage == 0,
        controller: controller,
        totalPages: 3,
      ),
      OnBoardingPageWidget(
        model: OnBoardingModel(onBoardingImage2, AppConstants.onBoardingTitle2,
            AppConstants.onBoardingSubTitle2, const Color(0xFFFFE0B2), size.height, 1),
        isActive: currentPage == 1,
        controller: controller,
        totalPages: 3,
      ),
      OnBoardingPageWidget(
        model: OnBoardingModel(onBoardingImage3, AppConstants.onBoardingTitle3,
            AppConstants.onBoardingSubTitle3, const Color(0xFFEDF6E5), size.height, 2),
        isActive: currentPage == 2,
        controller: controller,
        totalPages: 3,
      )
    ];

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: pages,
            liquidController: controller,
            onPageChangeCallback: onPageChangedCallback,
            enableSideReveal: true,
          ),
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () {
                controller.jumpToPage(page: 2);
              },
              child: Text(
                AppConstants.skip,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onTertiaryContainer),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            child: AnimatedSmoothIndicator(
              activeIndex: controller.currentPage,
              count: 3,
              effect: const WormEffect(
                  activeDotColor: Colors.black87, dotHeight: 5.0),
            ),
          )
        ],
      ),
    );
  }

  onPageChangedCallback(int activePageIndex) {
    setState(() {
      currentPage = activePageIndex;
    });
  }
}
