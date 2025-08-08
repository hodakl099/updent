import '../repositories/onboarding_repository.dart';

class GetOnboardingStatus {
  final OnboardingRepository repository;

  GetOnboardingStatus(this.repository);

  bool call() {
    return repository.hasSeenOnboarding();
  }
}
