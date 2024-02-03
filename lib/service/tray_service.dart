import 'dart:io';

import 'package:system_tray/system_tray.dart';

class TrayService {
  static final _systemTray = SystemTray();
  static Future<void> initSystemTray() async {
    final menu = Menu();
    String getTrayImagePath(String imageName) {
      return Platform.isWindows
          ? 'assets/$imageName.ico'
          : 'assets/$imageName.png';
    }

    await _systemTray.initSystemTray(
      iconPath: getTrayImagePath('app_icon'),
    );
    _systemTray.registerSystemTrayEventHandler((eventName) {
      print(eventName);
    });

    await menu.buildFrom(
      [
        MenuItemLabel(
          name: "preference",
          label: 'Preference',
          onClicked: (menuItem) {},
        ),
        MenuSeparator(),
        MenuItemLabel(
          name: "exit",
          label: 'Exit',
          onClicked: (menuItem) {},
        ),
      ],
    );
    _systemTray.setContextMenu(menu);
  }
}
