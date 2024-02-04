import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class KeySetting extends Equatable {
  const KeySetting({
    this.fontColor = Colors.white,
    this.fontSize = 20.0,
  });

  final Color fontColor;
  final double fontSize;

  @override
  List<Object?> get props => [
        fontColor,
        fontSize,
      ];
}
