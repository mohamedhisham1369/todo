import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo/core/routing/routes.dart';
import 'package:todo/features/archived/bloc/archived_cubit.dart';
import 'package:todo/features/archived/presentations/ui/archived_screen.dart';
import 'package:todo/features/done/bloc/done_cubit.dart';
import 'package:todo/features/done/presentations/ui/done_screen.dart';
import 'package:todo/features/main%20layout/bloc/main_cubit.dart';
import 'package:todo/features/main%20layout/presentation/ui/home_layout.dart';
import 'package:todo/features/new%20task/cubit/new_task_cubit.dart';
import 'package:todo/features/new%20task/presentations/ui/new_task_screen.dart';
import 'package:todo/features/onBoarding/Bloc/on_boarding_cubit.dart';
import 'package:todo/features/onBoarding/screens/on_boarding_screen.dart';
import 'package:todo/features/todo/bloc/todo_cubit.dart';
import 'package:todo/features/todo/presentations/ui/todo_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return PageTransition(
          child: BlocProvider(
            create: (context) => OnBoardingCubit(),
            child: const OnBoardingScreen(),
          ),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.center,
          settings: settings,
        );
      case Routes.newTaskScreen:
        return PageTransition(
          child: BlocProvider(
            create: (context) => NewTaskCubit(),
            child: NewTaskScreen(),
          ),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.center,
          settings: settings,
        );
      case Routes.mainlayoutScreen:
        return PageTransition(
          child: BlocProvider(
            create: (context) => MainCubit()..createDatabase(),
            child: const HomeLayout(),
          ),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.center,
          settings: settings,
        );

      default:
        return null;
    }
  }

  List<Widget> screens = [
    BlocProvider(
      create: (context) => TodoCubit()..getTodoTasks(),
      child: const TodoScreen(),
    ),
    BlocProvider(
      create: (context) => ArchivedCubit()..getArchivedTasks(),
      child: const ArchivedScreen(),
    ),
    BlocProvider(
      create: (context) => DoneCubit()..getDoneTasks(),
      child: const DoneScreen(),
    )
  ];
}
