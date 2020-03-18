import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:focusdetectorexample/presentation/common/bottom_navigation/adaptive_bottom_navigation_scaffold.dart';
import 'package:focusdetectorexample/presentation/common/bottom_navigation/bottom_navigation_tab.dart';
import 'package:focusdetectorexample/presentation/route_name_builder.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<BottomNavigationTab> _bottomNavigationTabs = [
    BottomNavigationTab(
      bottomNavigationBarItem: BottomNavigationBarItem(
        title: const Text('Characters'),
        icon: Icon(Icons.people),
      ),
      navigatorKey: GlobalKey<NavigatorState>(),
      initialRouteName: RouteNameBuilder.characterList(),
    ),
    BottomNavigationTab(
      bottomNavigationBarItem: BottomNavigationBarItem(
        title: const Text('Quotes'),
        icon: Icon(Icons.format_quote),
      ),
      navigatorKey: GlobalKey<NavigatorState>(),
      initialRouteName: RouteNameBuilder.quoteList(),
    )
  ];

  @override
  Widget build(BuildContext context) => AdaptiveBottomNavigationScaffold(
        navigationBarItems: _bottomNavigationTabs,
      );
}
