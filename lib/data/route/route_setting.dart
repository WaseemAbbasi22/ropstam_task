
import 'package:flutter/material.dart';
import 'package:ropstam_flutter_task/views/auth/login_view.dart';
import 'package:ropstam_flutter_task/views/home/home_view.dart';
import 'package:ropstam_flutter_task/views/splash/splash_screen.dart';
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
      case LogInView.routeName:
      return MaterialPageRoute(builder: (context) => const LogInView());
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case Splash.routeName:
      return MaterialPageRoute(builder: (context) => const Splash ());

    default:
      return errorRoute();
  }
}

Route<dynamic> errorRoute() {
  return MaterialPageRoute(
    builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Arggg!'),
        ),
        body: const Center(
          child: Text('Oh No! You should not be here! '),
        ),
      );
    },
  );
}
