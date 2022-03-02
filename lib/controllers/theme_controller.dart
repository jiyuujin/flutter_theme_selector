import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeSelectorProvider =
    StateProvider<ThemeMode>((ref) => ThemeMode.system);
