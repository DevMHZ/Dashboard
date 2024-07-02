import 'package:dashboard/dashboard.dart';
import 'package:flutter/material.dart';

import 'core/routing/app_router.dart';

void main() {
  runApp(DashApp(
    appRouter: AppRouter(),
  ));
}
