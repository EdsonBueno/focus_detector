import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  final resumeDetectorKey = UniqueKey();
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'FocusDetector Example',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: FocusDetector(
          key: resumeDetectorKey,
          child: Scaffold(
            appBar: AppBar(
              title: Text('FocusDetector Example'),
            ),
          ),
          onFocusGained: () {
            print('Focus gained, equivalent to onResume or viewDidAppear');
          },
          onFocusLost: () {
            print('Focus lost, equivalent to onPause or viewDidDisappear');
          },
        ),
      );
}
