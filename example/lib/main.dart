import 'package:flutter/material.dart';
import 'package:focus_detector_v2/focus_detector_v2.dart';
import 'package:logger/logger.dart';

class FocusDetectorExample extends StatelessWidget {
  const FocusDetectorExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => FocusDetector(
        onFocusLost: () {
          logger.i(
            'Focus Lost.'
            '\nTriggered when either [onVisibilityLost] or [onForegroundLost] '
            'is called.'
            '\nEquivalent to onPause() on Android or viewDidDisappear() on '
            'iOS.',
          );
        },
        onFocusGained: () {
          logger.i(
            'Focus Gained.'
            '\nTriggered when either [onVisibilityGained] or '
            '[onForegroundGained] '
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
            '\nIt means, for example, that the user sent your app to the '
            'background by opening another app or turned off the device\'s '
            'screen while your widget was visible.',
          );
        },
        onForegroundGained: () {
          logger.i(
            'Foreground Gained.'
            '\nIt means, for example, that the user switched back to your app '
            'or turned the device\'s screen back on while your widget was '
            'visible.',
          );
        },
        child: Material(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Send the app to the background or push another page and '
                  'watch the console.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    final route = MaterialPageRoute(
                      builder: (_) => const OtherPage(),
                    );
                    Navigator.of(context).push(route);
                  },
                  child: const Text(
                    'PUSH ANOTHER PAGE',
                  ),
                )
              ],
            ),
          ),
        ),
      );
}

class OtherPage extends StatelessWidget {
  const OtherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: const Padding(
          padding: EdgeInsets.all(16),
          child: Center(
            child: Text(
              'Look at the console and return to the first screen.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
      );
}

Logger logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    printTime: false,
  ),
);

void main() {
  runApp(
    MaterialApp(
      home: const FocusDetectorExample(),
      theme: ThemeData(),
    ),
  );
}
