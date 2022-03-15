import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:movies_app/router/app_routes.dart';
import 'package:movies_app/shared/themes/themes.dart';
import 'package:movies_app/movies/services/movies_service.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => MoviesService(),
          lazy: false,
        )
      ],
      child: const MyApp(),
    );
  }
}

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
      theme: AppTheme.lightTheme,
    );
  }
}
