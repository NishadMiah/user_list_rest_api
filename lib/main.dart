import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:user_list_rest_api/core/app_routes/app_routes.dart';
import 'package:user_list_rest_api/core/dependency/dependency_injection.dart';
import 'package:user_list_rest_api/utils/app_colors/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(428, 902),
      child: GetMaterialApp(
        title: 'CMED Task 2',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.backgroundClr,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        ),
        defaultTransition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 200),
        initialRoute: AppRoutes.homeScreen,
        getPages: AppRoutes.routes,
        initialBinding: DependencyInjection(),
      ),
    );
  }
}
