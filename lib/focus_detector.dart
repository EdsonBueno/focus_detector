library focus_detector;

import 'package:flutter/widgets.dart';
import 'package:visibility_detector/visibility_detector.dart';

class FocusDetector extends StatefulWidget {
  const FocusDetector({
    @required this.child,
    this.onFocusGained,
    this.onFocusLost,
    this.onVisibilityGained,
    this.onVisibilityLost,
    this.onForegroundGained,
    this.onForegroundLost,
    Key key,
  })  : assert(child != null),
        super(key: key);

  /// Called when the widget becomes visible or enters foreground while visible.
  final VoidCallback onFocusGained;

  /// Called when the widget becomes invisible or enters background while visible.
  final VoidCallback onFocusLost;

  /// Called when the widget becomes visible.
  final VoidCallback onVisibilityGained;

  /// Called when the widget becomes invisible.
  final VoidCallback onVisibilityLost;

  /// Called when the app entered the foreground while the widget is visible.
  final VoidCallback onForegroundGained;

  /// Called when the app is sent to background while the widget was visible.
  final VoidCallback onForegroundLost;

  final Widget child;

  @override
  _FocusDetectorState createState() => _FocusDetectorState();
}

class _FocusDetectorState extends State<FocusDetector>
    with WidgetsBindingObserver {
  final _visibilityDetectorKey = UniqueKey();
  bool _isVisible = false;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final isAppResumed = state == AppLifecycleState.resumed;
    if (isAppResumed && _isVisible) {
      _notifyFocusGain();
      _notifyForegroundGain();
      return;
    }

    final isAppPaused = state == AppLifecycleState.paused;
    if (isAppPaused && _isVisible) {
      _notifyFocusLoss();
      _notifyForegroundLoss();
    }
  }

  @override
  Widget build(BuildContext context) => VisibilityDetector(
        key: _visibilityDetectorKey,
        onVisibilityChanged: (visibilityInfo) {
          final visibleFraction = visibilityInfo.visibleFraction;
          _changeVisibilityStatus(visibleFraction);
        },
        child: widget.child,
      );

  void _changeVisibilityStatus(double newVisibleFraction) {
    final wasFullyVisible = _isVisible;
    final isFullyVisible = newVisibleFraction == 1;
    if (!wasFullyVisible && isFullyVisible) {
      _isVisible = true;
      _notifyFocusGain();
      _notifyVisibilityGain();
    }

    final isFullyInvisible = newVisibleFraction == 0;
    if (wasFullyVisible && isFullyInvisible) {
      _isVisible = false;
      _notifyFocusLoss();
      _notifyVisibilityLoss();
    }
  }

  void _notifyFocusGain() {
    if (widget.onFocusGained != null) {
      widget.onFocusGained();
    }
  }

  void _notifyFocusLoss() {
    if (widget.onFocusLost != null) {
      widget.onFocusLost();
    }
  }

  void _notifyVisibilityGain() {
    if (widget.onVisibilityGained != null) {
      widget.onVisibilityGained();
    }
  }

  void _notifyVisibilityLoss() {
    if (widget.onVisibilityLost != null) {
      widget.onVisibilityLost();
    }
  }

  void _notifyForegroundGain() {
    if (widget.onForegroundGained != null) {
      widget.onForegroundGained();
    }
  }

  void _notifyForegroundLoss() {
    if (widget.onForegroundLost != null) {
      widget.onForegroundLost();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
