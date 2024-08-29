import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/onBoarding/Bloc/on_boarding_states.dart';

class OnBoardingCubit extends Cubit<OnBoardingStates> {
  OnBoardingCubit() : super(OnBoardingInitialState());
  // static OnBoardingCubit get(context) => BlocProvider.of(context);

  int onBoardingIndex = 0;
  void changeOnBoardingIndex(int index) {
    onBoardingIndex = index;

    emit(OnBoardingNextState());
  }

  PageController pageController = PageController(initialPage: 0);

  List<String> onBoardingImages = [
    "images/1.png",
    "images/2.png",
    "images/3.png",
  ];
  List<String> onBoardingTitles = [
    "Manage your tasks",
    "Create daily routine",
    "Orgonaize your tasks",
  ];

  List<String> onBoardingDescriptions = [
    "You can easily manage all of your daily tasks in DoMe for free",
    "In Uptodo  you can create your personalized routine to stay productive",
    "You can organize your daily tasks by adding your tasks into separate categories",
  ];
}
