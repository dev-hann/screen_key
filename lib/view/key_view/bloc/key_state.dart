part of 'key_bloc.dart';

class KeyState extends Equatable {
  const KeyState({
    this.inputList = const [],
  });

  final List<String> inputList;
  @override
  List<Object?> get props => [
        inputList,
      ];

  KeyState copyWith({
    List<String>? inputList,
  }) {
    return KeyState(
      inputList: inputList ?? this.inputList,
    );
  }
}
