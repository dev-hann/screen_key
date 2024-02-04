// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'setting_bloc.dart';

class SettingState extends Equatable {
  const SettingState({
    this.setting = const KeySetting(),
    this.settingWindow,
  });

  final KeySetting setting;
  final MultiWindow? settingWindow;

  @override
  List<Object?> get props => [
        setting,
        settingWindow,
      ];

  SettingState copyWith({
    KeySetting? setting,
    Option<MultiWindow>? settingWindowOption,
  }) {
    return SettingState(
      setting: setting ?? this.setting,
      settingWindow: settingWindowOption == null
          ? settingWindow
          : settingWindowOption.toNullable(),
    );
  }
}
