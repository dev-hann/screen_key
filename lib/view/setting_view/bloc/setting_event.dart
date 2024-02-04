part of 'setting_bloc.dart';

abstract class SettingEvent {}

class SettingInited extends SettingEvent {
  SettingInited(this.setting);
  final WindowSetting setting;
}

class SettingUpdated extends SettingEvent {
  SettingUpdated(this.setting);
  final WindowSetting setting;
}
