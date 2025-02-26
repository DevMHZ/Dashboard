import 'package:dashboard/core/routing/app_router.dart';
import 'package:dashboard/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'core/routing/routes.dart';

class DashApp extends StatelessWidget {
  final AppRouter appRouter;
  const DashApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        child: GetMaterialApp(
          title: 'Dashboard Screen',
          theme: ThemeData(
            primaryColor: AppColor.appBlueColor,
            scaffoldBackgroundColor: Colors.white,
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.LoginView,
          onGenerateRoute: appRouter.generateRoute,
        ));
  }
}
