<p align="center">
	<img src="https://raw.githubusercontent.com/EdsonBueno/focus_detector/master/assets/logo.png" height="113" alt="Focus Detector Logo" />
</p>
<p align="center">
	<a href="https://pub.dev/packages/focus_detector"><img src="https://img.shields.io/pub/v/focus_detector.svg" alt="Pub.dev Badge"></a>
	<a href="https://github.com/EdsonBueno/focus_detector/actions"><img src="https://github.com/EdsonBueno/focus_detector/workflows/build/badge.svg" alt="GitHub Build Badge"></a>
	<a href="https://gitter.im/focus_detector/community"><img src="https://badges.gitter.im/focus_detector/community.svg" alt="Gitter Badge"></a>
	<a href="https://github.com/tenhobi/effective_dart"><img src="https://img.shields.io/badge/style-effective_dart-40c4ff.svg" alt="Effective Dart Badge"></a>
	<a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-purple.svg" alt="MIT License Badge"></a>
	<a href="https://github.com/EdsonBueno/focus_detector"><img src="https://img.shields.io/badge/platform-flutter-ff69b4.svg" alt="Flutter Platform Badge"></a>
</p>

# Focus Detector

Get notified every time your widget appears or disappears from the screen.

Similar to `onResume()`/`onPause()` on Android and `viewDidAppear()`/`viewDidDisappear()` on iOS.

Focus Detector fires callbacks for you whenever something happens to take or give your widget focus. Such an event might be, for instance, the user:
- Navigating to or from another screen;
- Turning the device’s screen on or off while your widget is visible;
- Switching to or from another app while your widget is visible;
- Scrolling your widget in or out the screen;

## Usage

```dart
@override
Widget build(BuildContext context) =>
    FocusDetector(
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
          '\nIt means the widget is visible within your app.',
        );
      },
      onForegroundLost: () {
        logger.i(
          'Foreground Lost.'
          '\nIt means, for example, that the user sent your app to the background by opening '
          'another app or turning off the device\'s screen while your '
          'widget was visible.',
        );
      },
      onForegroundGained: () {
        logger.i(
          'Foreground Gained.'
          '\nIt means, for example, that the user switched back to your app or turned the '
          'device\'s screen back on while your widget was visible.',
        );
      },
      child: Container(),
    );
```


## Usage Scenarios
- Turn on and off resource-consuming features, such as camera, location or bluetooth;
- Sync your data with a remote API or local database;
- Pause and resume video/audio playback or streaming;

## Sample
For a more complete sample, with more than one screen, please check out the `focus-detector/set-state-focus-detector` or `focus-detector/bloc-focus-detector` branches from the [Breaking Bapp repository](https://github.com/EdsonBueno/breaking_bapp).
