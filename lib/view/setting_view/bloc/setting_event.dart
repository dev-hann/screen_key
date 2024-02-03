part of 'setting_bloc.dart';

abstract class SettingEvent {}

class SettingInited extends SettingEvent {}

class SettingUpdated extends SettingEvent {
  SettingUpdated(this.newSetting);
  final Setting newSetting;
}
