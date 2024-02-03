part of 'key_bloc.dart';

abstract class KeyEvent extends Equatable {}

class KeyInited extends KeyEvent {
  @override
  List<Object?> get props => [];
}

class KeyUpdated extends KeyEvent {
  KeyUpdated(this.key);
  final String key;

  @override
  List<Object?> get props => [key];
}
