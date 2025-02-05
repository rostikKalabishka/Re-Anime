import 'package:re_anime_app/repositories/settings/settings_repository_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepository implements SettingsRepositoryInterface {
  final SharedPreferences sharedPreferences;
  static const _isDarkThemeSelectedKey = 'dark_theme_selected';
  static const _isOnboardingShownKey = 'onboarding_show';
  SettingsRepository({required this.sharedPreferences});
  @override
  bool isDarkThemeSelected() {
    try {
      return sharedPreferences.getBool(_isDarkThemeSelectedKey) ?? false;
    } catch (e) {
      rethrow;
    }
  }

  @override
  bool isOnboardingShown() {
    try {
      return sharedPreferences.getBool(_isOnboardingShownKey) ?? false;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> setOnboardingShown() async {
    try {
      await sharedPreferences.setBool(_isOnboardingShownKey, true);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> setDarkThemeSelected(bool selected) async {
    try {
      await sharedPreferences.setBool(_isDarkThemeSelectedKey, selected);
    } catch (e) {
      rethrow;
    }
  }
}
