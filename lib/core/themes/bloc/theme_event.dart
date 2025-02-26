part of 'theme_bloc.dart';

@freezed
class ThemeEvent with _$ThemeEvent {
  const factory ThemeEvent.switchDarkMode() = _SwitchDarkMode;
  const factory ThemeEvent.switchLightMode() = _SwitchLightMode;
}
