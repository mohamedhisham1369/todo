import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/theming/text_styles.dart';
import 'package:todo/core/widgets/loading_widget.dart';

import '../../bloc/done_cubit.dart';
import '../../bloc/done_states.dart';
import '../widgets/done_build_task_item.dart';

class DoneScreen extends StatelessWidget {
  const DoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DoneCubit, DoneState>(
        builder: (BuildContext context, DoneState state) {
          DoneCubit cubit = DoneCubit.get(context);
          if (state is DoneDatabaseLoadingState) {
            return const LoadingWidget();
          } else {
            return Scaffold(
              body: SafeArea(
                child: cubit.doneData.isNotEmpty
                    ? ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 20.sp),
                        itemBuilder: ((context, index) => DoneBuildTaskItem(
                              index: index,
                              cubit: DoneCubit.get(context),
                            )),
                        separatorBuilder: ((context, index) => Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Container(
                              color: Colors.grey,
                              height: 1,
                            ))),
                        itemCount: cubit.doneData.length,
                        scrollDirection: Axis.vertical,
                      )
                    : Center(
                        child: Text(
                          "No Done  available ",
                          style: Styles.textStyle20W600,
                        ),
                      ),
              ),
            );
          }
        },
      ),
    );
  }
}
