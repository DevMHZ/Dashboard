import 'package:dashboard/core/routing/routes.dart';
import 'package:dashboard/features/Login/View/login_screen.dart';
import 'package:dashboard/features/all_resturant/widgets/resturant_details.dart';
import 'package:dashboard/features/home/ui/home_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.LoginView:
        return MaterialPageRoute(
          builder: (_) => LoginView(),
        );

      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const DashboardScreen(),
        );
      case Routes.craeteRestaurantScreen:
        return MaterialPageRoute(
          builder: (_) => const DashboardScreen(),
        );
      case Routes.restaurantDetailsPage:
        return MaterialPageRoute(
          builder: (_) => RestaurantDetailsPage(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
