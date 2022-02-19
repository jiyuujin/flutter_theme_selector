import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_theme_selector/controllers/theme_controller.dart';
import 'package:flutter_theme_selector/data/themes.dart';
import 'package:flutter_theme_selector/widgets/animated_toggle_button.dart';

class ThemePage extends ConsumerWidget {
  const ThemePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeSelectorProvider);

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      key: key,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: height * 0.1),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: width * 0.35,
                    height: width * 0.35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: themeMode == ThemeMode.dark
                            ? darkMode.gradient
                            : lightMode.gradient,
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(40, 0),
                    child: Container(
                      width: width * 0.26,
                      height: width * 0.26,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: themeMode == ThemeMode.dark
                            ? darkMode.backgroundColor
                            : lightMode.backgroundColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.1,
              ),
              Text(
                'Choose a style',
                style: TextStyle(
                  color: themeMode == ThemeMode.dark
                      ? darkMode.textColor
                      : lightMode.textColor,
                  fontSize: width * 0.06,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Rubik',
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              SizedBox(
                width: width * 0.7,
                child: Text(
                  'Pop or subtle. Day or night. Customize your interface',
                  style: TextStyle(
                    color: themeMode == ThemeMode.dark
                        ? darkMode.textColor
                        : lightMode.textColor,
                    fontSize: width * 0.04,
                    fontFamily: 'Rubik',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: height * 0.06,
              ),
              AnimatedToggleButton(
                values: const ['Light', 'Dark'],
                textColor: themeMode == ThemeMode.dark
                    ? darkMode.textColor
                    : lightMode.textColor,
                backgroundColor: themeMode == ThemeMode.dark
                    ? darkMode.toggleBackgroundColor
                    : lightMode.toggleBackgroundColor,
                buttonColor: themeMode == ThemeMode.dark
                    ? darkMode.toggleButtonColor
                    : lightMode.toggleButtonColor,
                shadows: themeMode == ThemeMode.dark
                    ? darkMode.shadow
                    : lightMode.shadow,
                onToggleCallback: (enabled) {
                  if (enabled) {
                    ref.read(themeSelectorProvider.notifier).state =
                        ThemeMode.dark;
                  } else {
                    ref.read(themeSelectorProvider.notifier).state =
                        ThemeMode.light;
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildDot(
      {required double width, required double height, required Color color}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: width,
      height: height,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: color,
      ),
    );
  }
}
