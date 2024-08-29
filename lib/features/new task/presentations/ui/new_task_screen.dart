import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/functions/date_format.dart';
import 'package:todo/core/helpers/extensions.dart';
import 'package:todo/core/routing/routes.dart';
import 'package:todo/core/theming/colors.dart';
import 'package:todo/core/widgets/custom_button.dart';
import 'package:todo/core/widgets/custom_text_form_field.dart';
import 'package:todo/features/new%20task/cubit/new_task_cubit.dart';

class NewTaskScreen extends StatelessWidget {
  NewTaskScreen({super.key});
  final TextEditingController titleController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "New Task",
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "images/5.png",
                  // width: double.infinity,
                  // fit: BoxFit.fitWidth,
                  // height: 250.sp,
                ),
                // SizedBox(
                //   height: 40.h,
                // ),
                CustomTextFormField(
                  labelText: 'Title',
                  prefixIcon: const Icon(
                    Icons.title,
                    color: Colors.grey,
                  ),
                  controller: titleController,
                  keyboardType: TextInputType.text,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "Title cannot be empty..";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextFormField(
                  labelText: 'Date',
                  prefixIcon: const Icon(
                    Icons.calendar_month,
                    color: Colors.grey,
                  ),
                  readOnly: true,
                  controller: dateController,
                  onTap: () {
                    showDatePicker(
                      builder: (context, child) {
                        return Theme(
                          data: ThemeData.light().copyWith(
                            colorScheme: const ColorScheme.light(
                              surface: AppColors.containerColor,
                              onPrimary: Colors.white,
                              onSurface: Colors.white,
                            ),
                            dialogBackgroundColor: AppColors.containerColor,
                          ),
                          child: child!,
                        );
                      },
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2050),
                    ).then((value) {
                      if (value != null) {
                        dateController.text = formatDate(value.toString());
                      }
                    });
                  },
                  keyboardType: TextInputType.datetime,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "Date cannot be empty..";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextFormField(
                  controller: timeController,
                  labelText: 'Time',
                  prefixIcon: const Icon(
                    Icons.watch_later,
                    color: Colors.grey,
                  ),
                  readOnly: true,
                  onTap: () {
                    showTimePicker(
                      builder: (context, child) {
                        return Theme(
                          data: ThemeData.light().copyWith(
                            timePickerTheme: TimePickerThemeData(
                              dayPeriodTextColor:
                                  WidgetStateColor.resolveWith((states) {
                                if (states.contains(WidgetState.selected)) {
                                  return Colors.white;
                                }
                                return Colors.white;
                              }),
                              dayPeriodColor:
                                  WidgetStateColor.resolveWith((states) {
                                if (states.contains(WidgetState.selected)) {
                                  return AppColors.primaryColor;
                                } else {
                                  return AppColors.containerColor;
                                }
                              }),
                              hourMinuteTextColor: WidgetStateColor.resolveWith(
                                (states) => Colors.white,
                              ),
                              dialBackgroundColor: AppColors.containerColor,
                              dialTextColor: WidgetStateColor.resolveWith(
                                (states) => Colors.white,
                              ),
                            ),
                            colorScheme: const ColorScheme.light(
                              surface: AppColors.containerColor,
                              onPrimary: Colors.white,
                              onSurface: Colors.white,
                            ),
                            dialogBackgroundColor: AppColors.containerColor,
                          ),
                          child: child!,
                        );
                      },
                      context: context,
                      initialTime: TimeOfDay.now(),
                    ).then((value) {
                      if (value != null) {
                        final formattedTime = formatTimeOfDay(value);
                        timeController.text = formattedTime;
                      }
                    });
                  },
                  keyboardType: TextInputType.datetime,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "Time cannot be empty..";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 40.h,
                ),
                BlocConsumer<NewTaskCubit, NewTaskState>(
                  listener: (BuildContext context, state) {
                    if (state is DatabaseInsertState) {
                      context.pushNamedAndRemoveUntil(
                          Routes.mainlayoutScreen, (route) => false,
                          predicate: (route) => false);
                    }
                  },
                  builder: (context, state) {
                    return CustomButton(
                      text: "Save",
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<NewTaskCubit>().insertIntoDatabase(
                                title: titleController.text,
                                date: dateController.text,
                                time: timeController.text,
                              );
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
