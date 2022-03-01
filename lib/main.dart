import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_theme_selector/controllers/theme_controller.dart';
import 'package:flutter_theme_selector/data/themes.dart';
import 'package:flutter_theme_selector/theme.dart';

class LinkModel {
  LinkModel(this.name, this.url);

  final String name;
  final String url;
}

void main() async {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeSelectorProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Theme Selector',
      themeMode: themeMode,
      theme: Themes().light,
      darkTheme: Themes().dark,
      home: const MyHomePage(),
      initialRoute: '/',
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeSelectorProvider);
    return ThemePage(themeMode: themeMode);
  }
}
