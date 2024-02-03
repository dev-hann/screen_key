import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_key/model/setting.dart';
import 'package:window_manager/window_manager.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(SettingState()) {
    on<SettingInited>(onInited);
    on<SettingUpdated>(onUpdated);
  }

  FutureOr<void> onInited(SettingInited event, Emitter<SettingState> emit) {
    final setting = state.setting;
    final size = setting.size;
    final windowOptions = WindowOptions(
      size: size,
      minimumSize: size,
      maximumSize: size,
      center: true,
      backgroundColor: setting.backgroundColor,
      skipTaskbar: false,
      titleBarStyle:
          setting.hideTitleBar ? TitleBarStyle.hidden : TitleBarStyle.normal,
      windowButtonVisibility: false,
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.setSize(size);
      await windowManager.setResizable(false);
      await windowManager.setAlignment(setting.alignment);
      await windowManager.setAlwaysOnTop(true);
    });
  }

  FutureOr<void> onUpdated(SettingUpdated event, Emitter<SettingState> emit) {}
}
