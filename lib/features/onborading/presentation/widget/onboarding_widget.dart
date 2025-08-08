import 'package:flutter/material.dart';
import 'package:updent/core/get_localized.dart';
import 'package:updent/core/util/colors_ext.dart';
import 'package:updent/features/onborading/presentation/widget/main_button.dart';

class OnboardingWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final String imagePath;
  final bool showSkip;
  final VoidCallback onNextClicked;
  final VoidCallback? onSkipClicked;
  const OnboardingWidget(
      {Key? key,
      required this.imagePath,
      required this.subTitle,
      this.onSkipClicked,
      this.showSkip = false,
      required this.onNextClicked,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              // Top section with image and text
              Expanded(
                flex: 3,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: screenHeight * 0.05),
                      // Responsive image
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: screenHeight * 0.3,
                          maxWidth: screenWidth * 0.8,
                        ),
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.04),
                      // Title
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          title,
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontSize: screenWidth * 0.06,
                                  ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      // Subtitle
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          subTitle,
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontSize: screenWidth * 0.04,
                                  ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.05),
                    ],
                  ),
                ),
              ),

              // Bottom section with buttons
              Container(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (showSkip)
                      MainButton(
                        title: getLocalized(context, 'skipLbl'),
                        textColor: Theme.of(context).colorScheme.primary,
                        fillColor: Colors.white,
                        onBtnSelected: () {
                          if (onSkipClicked != null) {
                            onSkipClicked!();
                          }
                        },
                      ),
                    if (showSkip) SizedBox(height: screenHeight * 0.015),
                    MainButton(
                      title: getLocalized(context, 'nextLbl'),
                      textColor: Theme.of(context).colorScheme.lightWhiteText,
                      fillColor: Theme.of(context).colorScheme.primary,
                      onBtnSelected: () {
                        onNextClicked();
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
