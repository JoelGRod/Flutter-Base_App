import 'package:flutter/material.dart';

import 'package:movies_app/router/app_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      
      /* -------------- ROUTES ---------------------- */
      // Main app Routes (clean - refactorized)
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.getAppRoutes(),
      // Extra Routes (Routes that do not exist)
      onGenerateRoute: (settings) => AppRoutes.onGenerateRoute(settings), 
      /* -------------- END ROUTES ---------------------- */
      
      /* -------------- GLOBAL THEME -------------------- */
      // theme: MainTheme.lightTheme,
    );
  }
}
