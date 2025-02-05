abstract interface class SettingsRepositoryInterface {
  bool isDarkThemeSelected();
  Future<void> setDarkThemeSelected(bool selected);

  bool isOnboardingShown();
  Future<void> setOnboardingShown();
}
