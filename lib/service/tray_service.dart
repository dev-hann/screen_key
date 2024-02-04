import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:multi_window/multi_window.dart';
import 'package:screen_key/enum/tray_type.dart';
import 'package:system_tray/system_tray.dart';

typedef TrayCallback = Function(TrayType type);

class TrayService {
  TrayService._();
  static TrayService? _instance;
  static TrayService get instance {
    return _instance ??= TrayService._();
  }

  final _systemTray = SystemTray();

  Future<void> init() async {
    final menu = Menu();
    String getTrayImagePath(String imageName) {
      return Platform.isWindows
          ? 'assets/$imageName.ico'
          : 'assets/$imageName.png';
    }

    await _systemTray.initSystemTray(
      iconPath: getTrayImagePath('app_icon'),
    );

    await menu.buildFrom(
      [
        MenuItemLabel(
          name: "preference",
          label: 'Preference',
          onClicked: (menuItem) async {
            _onTapitem(TrayType.preference);
          },
        ),
        MenuSeparator(),
        MenuItemLabel(
          name: "exit",
          label: 'Exit',
          onClicked: (menuItem) {
            _onTapitem(TrayType.exit);
            // exit(0);
          },
        ),
      ],
    );
    _systemTray.setContextMenu(menu);
  }

  final List<TrayCallback> _listenerList = [];

  void addListener(TrayCallback listener) {
    _listenerList.add(listener);
  }

  void removeListener(TrayCallback listener) {
    _listenerList.remove(listener);
  }

  void _onTapitem(TrayType type) {
    for (final listener in _listenerList) {
      listener(type);
    }
  }
}
