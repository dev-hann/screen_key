part of 'setting_bloc.dart';

class SettingState extends Equatable {
  final Setting setting = const Setting();
  @override
  List<Object?> get props => [
        setting,
      ];
}
