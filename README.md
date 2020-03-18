# FocusDetector

Wrapper around Google's [VisibilityDetector](https://github.com/google/flutter.widgets/tree/master/packages/visibility_detector) for combining it with Flutter's WidgetsBindingObserver in order to achieve Android's onResume/onPause and iOS's viewDidAppear/viewDidDisappear on Flutter.

## How Does it Work?

A FocusDetector widget takes in a child and optional `onFocusGained`/`onFocusLost` callbacks and fires those as the widget's focus changes.
Some cases that trigger the focus change:
1. When the widget is first created;
2. When its route is popped back to;
3. When the app is sent to background/foreground while the widget was visible;

## Article
[https://edsonbueno.com](https://edsonbueno.com)

## Sample
Check out the `set-state-focus-detector` or `bloc-focus-detector` branch of the [Breaking Bapp repository](https://github.com/EdsonBueno/breaking_bapp).