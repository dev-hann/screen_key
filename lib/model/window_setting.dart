import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class WindowSetting extends Equatable {
  const WindowSetting({
    required this.size,
    required this.backgroundColor,
    required this.hideTitleBar,
    required this.alignment,
    required this.alwaysOnTap,
    required this.preventclose,
  });

  static keyView() {
    return const WindowSetting(
      size: Size(400, 150),
      backgroundColor: Colors.black45,
      hideTitleBar: true,
      alignment: Alignment.bottomRight,
      alwaysOnTap: true,
      preventclose: true,
    );
  }

  static settingView() {
    return const WindowSetting(
      size: Size(800, 650),
      backgroundColor: Colors.black45,
      hideTitleBar: false,
      alignment: Alignment.center,
      alwaysOnTap: false,
      preventclose: true,
    );
  }

  final Size size;
  final Color backgroundColor;
  final bool hideTitleBar;
  final Alignment alignment;
  final bool alwaysOnTap;
  final bool preventclose;

  @override
  List<Object?> get props => [
        size,
        backgroundColor,
        hideTitleBar,
        alignment,
        alwaysOnTap,
        preventclose,
      ];
}
