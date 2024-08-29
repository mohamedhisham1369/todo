import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/theming/colors.dart';

import '../../bloc/done_cubit.dart';

class DoneBuildTaskItem extends StatelessWidget {
  const DoneBuildTaskItem(
      {super.key, required this.index, required this.cubit});
  final int index;
  final DoneCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(cubit.doneData[index]['id'].toString()),
      onDismissed: (direction) async {
        await cubit.deleteFromDone(cubit.doneData[index]['id']);
      },
      background: Container(
        width: double.infinity,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20.w),
        color: AppColors.errorColor,
        child: Icon(Icons.delete, color: Colors.white, size: 24.sp),
      ),
      direction: DismissDirection.endToStart,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h),
        decoration: BoxDecoration(
          color: AppColors.containerColor,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(0, 4.h),
              blurRadius: 6.r,
            ),
          ],
        ),
        padding: EdgeInsets.all(12.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 30.sp,
              backgroundColor: AppColors.primaryColor,
              child: Text(
                cubit.doneData[index]['time'],
                style: TextStyle(color: Colors.white, fontSize: 12.sp),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cubit.doneData[index]['title'],
                    style: TextStyle(
                      color: AppColors.primarytextColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    cubit.doneData[index]['date'],
                    style: TextStyle(
                      color: AppColors.secondarygreyColor,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 12.w),
            IconButton(
              onPressed: () {
                cubit.updateInDone(
                  status: "New",
                  id: cubit.doneData[index]['id'],
                );
              },
              icon: Icon(Icons.check_circle,
                  color: AppColors.successColor, size: 24.sp),
            ),
            SizedBox(width: 4.w),
            IconButton(
              onPressed: () {
                cubit.updateInDone(
                  status: "Archived",
                  id: cubit.doneData[index]['id'],
                );
              },
              icon: Icon(Icons.archive_rounded,
                  color: AppColors.greyColor, size: 24.sp),
            ),
          ],
        ),
      ),
    );
  }
}
