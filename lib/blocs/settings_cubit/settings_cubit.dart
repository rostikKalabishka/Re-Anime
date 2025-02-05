import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:re_anime_app/repositories/settings/settings.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit({required SettingsRepositoryInterface settingsRepository})
      : _settingsRepository = settingsRepository,
        super(SettingsState(
            brightness: Brightness.dark, isOnboardingShowing: false)) {
    _checkSelectedTheme();
    _checkShowOnboarding();
  }

  final SettingsRepositoryInterface _settingsRepository;

  void _checkShowOnboarding() {
    try {
      final isShowOnboarding = _settingsRepository.isOnboardingShown();
      emit(SettingsState(isOnboardingShowing: isShowOnboarding));
    } catch (e) {
      log(e.toString());
    }
  }

  void _checkSelectedTheme() {
    try {
      final brightness = _settingsRepository.isDarkThemeSelected()
          ? Brightness.dark
          : Brightness.light;

      emit(SettingsState(brightness: brightness));
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> setOnboardingShown() async {
    try {
      await _settingsRepository.setOnboardingShown();
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> setThemeBrightness(Brightness brightness) async {
    try {
      emit(SettingsState(brightness: brightness));
      await _settingsRepository
          .setDarkThemeSelected(brightness == Brightness.dark);
    } catch (e) {
      log(e.toString());
    }
  }
}
