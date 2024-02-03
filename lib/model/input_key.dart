import 'package:equatable/equatable.dart';
import 'package:screen_key/const/key_map.dart';

enum InputKeyStatusType {
  released,
  pressed,
  held,
}

class InputKey extends Equatable {
  const InputKey({
    required this.keyCode,
    required this.statusValue,
  });

  final int keyCode;
  String get key {
    return keyMap[keyCode] ?? "undifined : $keyCode";
  }

  final int statusValue;

  InputKeyStatusType get statusType {
    return InputKeyStatusType.values[statusValue];
  }

  @override
  List<Object?> get props => [
        keyCode,
        statusValue,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': keyCode,
      'value': statusValue,
    };
  }

  factory InputKey.fromList(List<int> value) {
    return InputKey(
      keyCode: value[42],
      statusValue: value[44],
    );
  }
}
