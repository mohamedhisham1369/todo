import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/helpers/extensions.dart';
import 'package:todo/core/routing/app_router.dart';
import 'package:todo/core/routing/routes.dart';
import 'package:todo/core/theming/colors.dart';
import 'package:todo/core/theming/text_styles.dart';
import 'package:todo/core/widgets/loading_widget.dart';
import 'package:todo/features/main%20layout/bloc/main_cubit.dart';
import 'package:todo/features/main%20layout/bloc/main_states.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
        builder: (BuildContext context, MainState state) {
      MainCubit cubit = MainCubit.get(context);
      if (state is DatabaseCreateLoadingState) {
        return const LoadingWidget();
      } else {
        return Scaffold(
          appBar: AppBar(
            title: Text(cubit.titles[cubit.currentIndex],
                style: Styles.textStyle16W600.copyWith(
                    // color: Colors.white
                    )),
            centerTitle: true,
            leading: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            actions: [
              const CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://img.freepik.com/premium-vector/man-with-shirt-that-says-d-it_704913-37100.jpg?w=826")),
              5.horizontalSpace,
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
             
              context.pushNamed(Routes.newTaskScreen);
            },
            backgroundColor: AppColors.primaryColor,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (id) {
              cubit.changeIndex(id);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Todo'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.archive), label: 'Archived'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.done_all), label: 'Done'),
            ],
          ),
          body: AppRouter().screens[cubit.currentIndex],
        );
      }
    });
  }
}
