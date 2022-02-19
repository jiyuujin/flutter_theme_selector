import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeSelectorProvider =
    StateProvider<ThemeMode>((ref) => ThemeMode.system);

final isDarkModeProvider = Provider<bool>((ref) {
  final themeMode = ref.watch(themeSelectorProvider.notifier).state;
  return themeMode == ThemeMode.dark;
});
