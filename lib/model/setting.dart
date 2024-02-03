import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Setting extends Equatable {
  const Setting({
    this.size = const Size(400, 150),
    this.backgroundColor = Colors.black45,
    this.fontColor = Colors.white,
    this.hideTitleBar = true,
    this.alignment = Alignment.bottomRight,
  });

  final Size size;
  final Color backgroundColor;
  final Color fontColor;
  final bool hideTitleBar;
  final Alignment alignment;

  @override
  List<Object?> get props => [
        size,
        backgroundColor,
        fontColor,
        hideTitleBar,
        alignment,
      ];
}
