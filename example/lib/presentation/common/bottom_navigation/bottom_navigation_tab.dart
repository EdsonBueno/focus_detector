import 'package:flutter/widgets.dart';

/// Contains the necessary parameters for building either a
/// [MaterialBottomNavigationScaffold] or [CupertinoBottomNavigationScaffold].
/// Detailed tutorial on this: https://edsonbueno.com/2020/01/23/bottom-navigation-in-flutter-mastery-guide/
class BottomNavigationTab {
  const BottomNavigationTab({
    @required this.bottomNavigationBarItem,
    @required this.navigatorKey,
    @required this.initialRouteName,
  })  : assert(bottomNavigationBarItem != null),
        assert(navigatorKey != null),
        assert(initialRouteName != null);

  final BottomNavigationBarItem bottomNavigationBarItem;
  final GlobalKey<NavigatorState> navigatorKey;
  final String initialRouteName;
}
