import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_window/multi_widget.dart';
import 'package:multi_window/multi_window.dart';
import 'package:screen_key/service/window_service.dart';
import 'package:screen_key/view/key_view/bloc/key_bloc.dart';
import 'package:screen_key/view/key_view/key_view.dart';
import 'package:screen_key/view/setting_view/bloc/setting_bloc.dart';
import 'package:screen_key/view/setting_view/setting_view.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  MultiWindow.init(args);
  await WindowService.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ScreenKey',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => KeyBloc(),
          ),
          BlocProvider(
            create: (_) => SettingBloc(),
          ),
        ],
        child: MultiWidget(
          const {
            "setting": SettingView(),
          },
          fallback: const KeyView(),
        ),
      ),
    );
  }
}
