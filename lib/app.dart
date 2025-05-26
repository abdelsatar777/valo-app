import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/resources/app_color.dart';
import 'core/widgets/app_provider.dart';
import 'core/widgets/app_routes.dart';
import 'features/splash/UI/screens/splash_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // مقاس التصميم الأساسي (مثلاً iPhone X)
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: AppProvider.appProvider,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.dark().copyWith(
              scaffoldBackgroundColor: AppColor.backgroundColor,
              textTheme: ThemeData.dark().textTheme.apply(
                fontFamily: 'Bowlby',
              ),
            ),
            routes: AppRoutes.routesList,
            home: child,
          ),
        );
      },
      child: const SplashScreen(), // ده بيتبعت كـ child للـ ScreenUtilInit
    );
  }
}
