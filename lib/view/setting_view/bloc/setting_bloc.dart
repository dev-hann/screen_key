import 'dart:async';
import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:multi_window/multi_window.dart';
import 'package:screen_key/enum/tray_type.dart';
import 'package:screen_key/model/setting.dart';
import 'package:screen_key/model/window_setting.dart';
import 'package:screen_key/service/tray_service.dart';
import 'package:screen_key/service/window_service.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(const SettingState()) {
    on<SettingInited>(onInited);
    on<SettingUpdated>(onUpdated);
  }

  final windowService = WindowService.instance;
  final trayService = TrayService.instance;

  FutureOr<void> onInited(
      SettingInited event, Emitter<SettingState> emit) async {
    trayService.init();
    trayService.addListener(
      (type) async {
        switch (type) {
          case TrayType.preference:
            MultiWindow.create(
              "setting",
              title: "Screen Key",
              size: const Size(800, 600),
              alignment: Alignment.center,
            );
            break;
          case TrayType.exit:
            exit(0);
        }
      },
    );

    add(SettingUpdated(event.setting));
  }

  FutureOr<void> onUpdated(SettingUpdated event, Emitter<SettingState> emit) {
    final setting = event.setting;
    windowService.updateHieTitleBar(setting.hideTitleBar);
    windowService.updateSize(setting.size);
    windowService.updateAlignment(setting.alignment);
    windowService.updateBackground(setting.backgroundColor);
    windowService.updateAlwaysOnTap(setting.alwaysOnTap);
    windowService.updatePreventClose(setting.preventclose);
    windowService.show();
  }
}
