import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class WindowService {
  WindowService._();

  static WindowService? _instance;

  static WindowService get instance {
    return _instance ??= WindowService._();
  }

  Future init() {
    return windowManager.ensureInitialized();
  }

  Future updateSize(Size size) {
    return windowManager.setSize(size);
  }

  Future updateAlignment(Alignment alignment) {
    return windowManager.setAlignment(alignment);
  }

  Future updateBackground(Color color) {
    return windowManager.setBackgroundColor(color);
  }

  Future updateHieTitleBar(bool value) {
    return windowManager
        .setTitleBarStyle(value ? TitleBarStyle.hidden : TitleBarStyle.normal);
  }

  Future updateAlwaysOnTap(bool value) {
    return windowManager.setAlwaysOnTop(value);
  }

  Future show() {
    return windowManager.show();
  }

  Future updatePreventClose(bool value) {
    return windowManager.setPreventClose(value);
  }
}
