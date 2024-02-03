import 'dart:async';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_key/model/input_key.dart';

part 'key_event.dart';
part 'key_state.dart';

class KeyBloc extends Bloc<KeyEvent, KeyState> {
  KeyBloc() : super(const KeyState()) {
    on<KeyInited>(_onInited);
    on<KeyUpdated>(_onUpdated);
  }

  FutureOr<void> _onInited(KeyInited event, Emitter<KeyState> emit) async {
    final file = File("/dev/input/event3");
    await emit.onEach<List<int>>(
      file.openRead(),
      onData: (event) {
        final keyEvent = InputKey.fromList(event);
        switch (keyEvent.statusType) {
          case InputKeyStatusType.released:
            break;
          case InputKeyStatusType.pressed:
          case InputKeyStatusType.held:
            add(KeyUpdated(keyEvent.key));
        }
      },
    );
  }

  FutureOr<void> _onUpdated(KeyUpdated event, Emitter<KeyState> emit) {
    final inputList = [...state.inputList];
    if (inputList.length > 10) {
      inputList.removeAt(0);
    }
    inputList.add(event.key);

    emit(
      state.copyWith(
        inputList: inputList,
      ),
    );
  }
}
