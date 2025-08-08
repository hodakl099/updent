import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:updent/features/onborading/domain/use_cases/get_onboarding_status.dart';
import 'package:updent/features/onborading/domain/use_cases/set_onboarding_status.dart';
part 'onboarding_state.dart';

class OnboardingError extends OnboardingState {
  final String message;
  OnboardingError(this.message);
}

class OnboardingCubit extends Cubit<OnboardingState> {
  final GetOnboardingStatus getOnboardingStatus;
  final SetOnboardingShown setOnboardingShown;

  OnboardingCubit({
    required this.getOnboardingStatus,
    required this.setOnboardingShown,
  }) : super(OnboardingInitial());

  // Fetch onboarding status on initialization
  void checkOnboardingStatus() async {
    try {
      bool status = await getOnboardingStatus();
      if (status) {
        emit(OnboardingCompleted());
      } else {
        emit(OnboardingInitial());
      }
    } catch (e) {
      emit(OnboardingError(e.toString()));
    }
  }

  // Complete the onboarding and update the status
  void completeOnboarding() async {
    try {
      await setOnboardingShown();
      emit(OnboardingCompleted());
    } catch (e) {
      emit(OnboardingError(e.toString()));
    }
  }

  void nextSetp() async {
    try {
      await setOnboardingShown();
      emit(OnboardingNexSetp());
    } catch (e) {
      emit(OnboardingError(e.toString()));
    }
  }
}
