import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_key/view/key_view/bloc/key_bloc.dart';
import 'package:screen_key/view/key_view/key_view.dart';
import 'package:screen_key/view/setting_view/bloc/setting_bloc.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
        child: const KeyView(),
      ),
    );
  }
}
