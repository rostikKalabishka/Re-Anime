part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  const SettingsState(
      {this.brightness = Brightness.dark, this.isOnboardingShowing = false});
  final Brightness brightness;
  final bool isOnboardingShowing;

  bool get isDark => brightness == Brightness.dark;
  @override
  List<Object> get props => [brightness, isOnboardingShowing];

  SettingsState copyWith({
    Brightness? brightness,
    bool? isOnboardingShowing,
  }) {
    return SettingsState(
      brightness: brightness ?? this.brightness,
      isOnboardingShowing: isOnboardingShowing ?? this.isOnboardingShowing,
    );
  }
}
