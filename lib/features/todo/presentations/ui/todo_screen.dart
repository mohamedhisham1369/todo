import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/theming/text_styles.dart';
import 'package:todo/core/widgets/loading_widget.dart';

import '../../bloc/todo_cubit.dart';
import '../../bloc/todo_states.dart';
import '../widgets/todo_build_task_item.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TodoCubit cubit = TodoCubit.get(context);

    return BlocBuilder<TodoCubit, TodoState>(
      builder: (BuildContext context, TodoState state) {
        if (state is TodoGetLoadingState) {
          return const LoadingWidget();
        } else {
          return Scaffold(
            body: SafeArea(
              child: cubit.todoData.isNotEmpty
                  ? ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 20.sp),
                      itemBuilder: ((context, index) => TodoBuildTaskItem(
                            index: index,
                            cubit: cubit,
                          )),
                      separatorBuilder: ((context, index) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0.sp),
                          child: Container(
                            color: Colors.grey,
                            height: 1.h,
                          ))),
                      itemCount: cubit.todoData.length,
                    )
                  : Center(
                      child: Text(
                        "No Todo available ",
                        style: Styles.textStyle20W600,
                      ),
                    ),
            ),
          );
        }
      },
    );
  }
}
