import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    printTime: false,
  ),
);

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => FocusDetector(
        onFocusLost: () {
          logger.i(
            'Focus Lost.'
            '\nTriggers when either [onVisibilityLost] or [onForegroundLost] '
            'is called.'
            '\nEquivalent to onPause() on Android or viewDidDisappear() on iOS.',
          );
        },
        onFocusGained: () {
          logger.i(
            'Focus Gained.'
            '\nTriggered when either [onVisibilityGained] or [onForegroundGained] '
            'is called.'
            '\nEquivalent to onResume() on Android or viewDidAppear() on iOS.',
          );
        },
        onVisibilityLost: () {
          logger.i(
            'Visibility Lost.'
            '\nIt means the widget is no longer visible within your app.',
          );
        },
        onVisibilityGained: () {
          logger.i(
            'Visibility Gained.'
            '\nIt means the widget is now visible within your app.',
          );
        },
        onForegroundLost: () {
          logger.i(
            'Foreground Lost.'
            '\nIt means the user sent your app to the background by opening '
            'another app or turning off the device\'s screen while your '
            'widget was visible.',
          );
        },
        onForegroundGained: () {
          logger.i(
            'Foreground Gained.'
            '\nIt means the user switched back to your app or turned the '
            'device\'s screen back on while your widget is visible.',
          );
        },
        child: Container(),
      );
}
