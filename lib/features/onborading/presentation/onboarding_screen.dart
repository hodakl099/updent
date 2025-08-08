import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:updent/core/get_localized.dart';
import 'package:updent/core/util/blured_router.dart';
import 'package:updent/core/util/routes.dart';
import 'package:updent/features/onborading/presentation/cubit/cubit/onboarding_cubit.dart';
import 'package:updent/features/onborading/presentation/widget/onboarding_widget.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  static route(RouteSettings settings) {
    return BlurredRouter(
      builder: (context) {
        return const Onboarding();
      },
    );
  }

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return // Trigger Cubit logic here if needed
        Scaffold(
      body: BlocConsumer<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          if (state is OnboardingError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: getOnboardingWidget(context, currentIndex),
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            );
          }
        },
        listener: (BuildContext context, OnboardingState state) {
          if (state is OnboardingNexSetp) {
            setState(() {
              currentIndex = currentIndex + 1;
            });
          }
          if (state is OnboardingCompleted) {
            Navigator.pushReplacementNamed(context, Routers.welcomeSCreen);
          }
        },
      ),
    );
  }

  // Function to return different widgets based on the current index
  Widget getOnboardingWidget(BuildContext context, int index) {
    final onBoradingBloc = BlocProvider.of<OnboardingCubit>(context);
    switch (index) {
      case 0:
        return onboarding1(
          onNextClicked: () {
            onBoradingBloc.nextSetp();
          },
          onSkipClicked: () {
            onBoradingBloc.completeOnboarding();
          },
          context: context,
        );
      case 1:
        return onboarding2(
          context: context,
          onNextClicked: () {
            onBoradingBloc.nextSetp();
          },
        );
      case 2:
        return onboarding3(
          onNextClicked: () {
            onBoradingBloc.completeOnboarding();
          },
          context: context,
        );
      default:
        return onboarding1(
          onNextClicked: () {
            onBoradingBloc.nextSetp();
          },
          //if on skip click, set don't show onbarding shared preference to false.
          onSkipClicked: () {
            onBoradingBloc.completeOnboarding();
          },
          context: context,
        );
    }
  }
}

Widget onboarding1({
  required VoidCallback onNextClicked,
  required VoidCallback onSkipClicked,
  required BuildContext context,
}) {
  return OnboardingWidget(
    imagePath: 'assets/images/on_boarding_1.png',
    title: getLocalized(context, 'onBorading1Title'),
    subTitle: getLocalized(context, 'onBorading1subTitle'),
    onNextClicked: onNextClicked,
    onSkipClicked: onSkipClicked,
    showSkip: true,
  );
}

Widget onboarding2({
  required VoidCallback onNextClicked,
  required BuildContext context,
}) {
  return OnboardingWidget(
    imagePath: 'assets/images/on_boarding_2.png',
    title: getLocalized(context, 'onBorading2Title'),
    subTitle: getLocalized(context, 'onBorading2subTitle'),
    onNextClicked: onNextClicked,
  );
}

Widget onboarding3({
  required VoidCallback onNextClicked,
  required BuildContext context,
}) {
  return OnboardingWidget(
    imagePath: 'assets/images/on_boarding_3.png',
    title: getLocalized(context, 'onBorading3Title'),
    subTitle: getLocalized(context, 'onBorading3subTitle'),
    onNextClicked: onNextClicked,
  );
}
