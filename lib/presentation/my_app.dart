import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportzride/presentation/blocs/auth/auth_cubit.dart';
import 'package:sportzride/presentation/blocs/auth_wallet/auth_wallet_cubit.dart';
import 'package:sportzride/presentation/journeys/splash_screen/splash_screen.dart';
import 'package:sportzride/presentation/resources/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => AuthCubit()),
            BlocProvider(create: (context) => AuthWalletCubit()),
          ],
          child: MaterialApp(
            title: 'Sportzride',
            debugShowMaterialGrid: false,
            theme: AppTheme.get(),
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
          ),
        );
      },
    );
  }
}
