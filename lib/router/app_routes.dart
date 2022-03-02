import 'package:flutter/material.dart';

import '../shared/models/models.dart';
import '../movies/screens/screens.dart';

class AppRoutes {

  static const initialRoute = 'home';

  // Menu Options Routes
  static final List<MenuOption> menuOptions = <MenuOption>[
    MenuOption(
      name: 'Movie Details', 
      routeName: 'movie_details', 
      screen: const DetailsScreen(),
      icon: Icons.details_outlined
      ),
  ];

  // Routes
  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    final Map<String, Widget Function(BuildContext)> options = {};

    options.addAll({ 
      'home': (BuildContext context) => const HomeScreen() 
    });

    for (final option in menuOptions) {
      options.addAll(
        { option.routeName: (BuildContext context) => option.screen }
      );
    }

    return options;
  }

  // Extra Routes
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const HomeScreen());
  }

}