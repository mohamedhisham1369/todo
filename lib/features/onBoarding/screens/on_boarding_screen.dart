import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/helpers/extensions.dart';
import 'package:todo/core/routing/routes.dart';
import 'package:todo/core/theming/colors.dart';
import 'package:todo/core/theming/text_styles.dart';
import 'package:todo/core/widgets/custom_button.dart';
import 'package:todo/features/onBoarding/Bloc/on_boarding_cubit.dart';
import 'package:todo/features/onBoarding/Bloc/on_boarding_states.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OnBoardingCubit onBoardingCubit = BlocProvider.of<OnBoardingCubit>(context);
    return Scaffold(
      body: BlocBuilder<OnBoardingCubit, OnBoardingStates>(
        builder: (context, state) {
          return PageView.builder(
            itemCount: onBoardingCubit.onBoardingImages.length,
            controller: onBoardingCubit.pageController,
            onPageChanged: (index) {
              onBoardingCubit.changeOnBoardingIndex(index);
            },
            itemBuilder: (context, index) {
              bool isCurrentPage = index == onBoardingCubit.onBoardingIndex;

              return SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.easeInOut,
                      width: 213.sp,
                      height: isCurrentPage ? 250.h : 200.h,
                      child: AnimatedAlign(
                        duration: const Duration(milliseconds: 800),
                        alignment: isCurrentPage
                            ? Alignment.center
                            : Alignment.topCenter,
                        child: Image.asset(
                          onBoardingCubit.onBoardingImages[index],
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    DotsIndicator(
                      dotsCount: 3,
                      position: onBoardingCubit.onBoardingIndex,
                      decorator: DotsDecorator(
                        activeColor: Colors.white,
                        size: Size.square(10.r),
                        activeSize: Size(30.r, 10.r),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 600),
                      opacity: isCurrentPage ? 1.0 : 0.0,
                      child: Column(
                        children: [
                          20.verticalSpace,
                          Text(onBoardingCubit.onBoardingTitles[index],
                              textAlign: TextAlign.center,
                              style: Styles.textStyle32W700),
                          20.verticalSpace,
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.8,
                            child: Text(
                              onBoardingCubit.onBoardingDescriptions[index],
                              style: Styles.textStyle16W400.copyWith(
                                  color: AppColors.secondarygreyColor),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.sp),
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              text: "back",
                              onPressed: () async {
                                // if (onBoardingCubit.onBoardingIndex == 2) {
                                //   context.pushReplacementNamed(
                                //       Routes.mainlayoutScreen);
                                // } else {
                                onBoardingCubit.pageController.previousPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );
                                // }
                              },
                            ),
                          ),
                          const Spacer(),
                          Expanded(
                            child: CustomButton(
                              text: "Next",
                              onPressed: () async {
                                if (onBoardingCubit.onBoardingIndex == 2) {
                                  context.pushReplacementNamed(
                                      Routes.mainlayoutScreen);
                                } else {
                                  onBoardingCubit.pageController.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut,
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
