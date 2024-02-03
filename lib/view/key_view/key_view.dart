import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_key/view/key_view/bloc/key_bloc.dart';
import 'package:screen_key/view/setting_view/bloc/setting_bloc.dart';

class KeyView extends StatefulWidget {
  const KeyView({super.key});

  @override
  State<KeyView> createState() => _KeyViewState();
}

class _KeyViewState extends State<KeyView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SettingBloc>(context, listen: false).add(SettingInited());
    BlocProvider.of<KeyBloc>(context, listen: false).add(KeyInited());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingBloc, SettingState>(
      builder: (context, state) {
        final setting = state.setting;
        return BlocBuilder<KeyBloc, KeyState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: Text(
                  state.inputList.join(" "),
                  style: TextStyle(
                    color: setting.fontColor,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
