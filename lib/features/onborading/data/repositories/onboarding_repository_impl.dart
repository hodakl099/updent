import 'package:updent/features/onborading/domain/repositories/onboarding_repository.dart';

import '../data_sources/onboarding_local_data_source.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingLocalDataSource localDataSource;

  OnboardingRepositoryImpl({required this.localDataSource});

  @override
  Future<void> setOnboardingShown() async {
    await localDataSource.setOnboardingShown();
  }

  @override
  bool hasSeenOnboarding() {
    return localDataSource.hasSeenOnboarding();
  }
}
