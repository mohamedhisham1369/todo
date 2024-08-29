import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/bloc_observer.dart';
import 'package:todo/core/cache_helper/cache_helper.dart';
import 'package:todo/core/routing/app_router.dart';
import 'package:todo/core/routing/routes.dart';
import 'package:todo/core/theming/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  await ScreenUtil.ensureScreenSize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,        initialRoute: Routes.onBoardingScreen,
        onGenerateRoute: AppRouter().generateRoute,
        theme: lightTheme,
        builder: EasyLoading.init(),
      ),
    );
  }
}
