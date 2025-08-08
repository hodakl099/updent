import '../repositories/onboarding_repository.dart';

class SetOnboardingShown {
  final OnboardingRepository repository;

  SetOnboardingShown(this.repository);

  Future<void> call() async {
    await repository.setOnboardingShown();
  }
}
