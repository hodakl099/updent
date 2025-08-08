import 'package:hive/hive.dart';

abstract class OnboardingLocalDataSource {
  Future<void> setOnboardingShown();
  bool hasSeenOnboarding();
}

class OnboardingLocalDataSourceImpl implements OnboardingLocalDataSource {
  final Box _box;

  OnboardingLocalDataSourceImpl(this._box);

  @override
  Future<void> setOnboardingShown() async {
    await _box.put('onboarding_shown', true);
  }

  @override
  bool hasSeenOnboarding() {
    return _box.get('onboarding_shown', defaultValue: false);
  }
}
