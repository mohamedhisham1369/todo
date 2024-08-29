import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/theming/text_styles.dart';
import 'package:todo/core/widgets/loading_widget.dart';
import 'package:todo/features/archived/bloc/archived_cubit.dart';
import 'package:todo/features/archived/bloc/archived_states.dart';
import 'package:todo/features/archived/presentations/widgets/archived_build_task_item.dart';

class ArchivedScreen extends StatelessWidget {
  const ArchivedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ArchivedCubit cubit = ArchivedCubit.get(context);

    return BlocBuilder<ArchivedCubit, ArchivedState>(
      builder: (BuildContext context, ArchivedState state) {
        if (state is ArchivedGetLoadingState) {
          return const LoadingWidget();
        } else {
          return Scaffold(
            body: SafeArea(
              child: cubit.archivedData.isNotEmpty
                  ? ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 20.sp),
                      itemBuilder: ((context, index) => ArchivedBuildTaskItem(
                            index: index,
                            cubit: cubit,
                          )),
                      separatorBuilder: ((context, index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Container(
                            color: Colors.grey,
                            height: 1,
                          ))),
                      itemCount: cubit.archivedData.length,
                      scrollDirection: Axis.vertical,
                    )
                  : Center(
                      child: Text(
                        "No archive available ",
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
