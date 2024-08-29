import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Separator extends StatelessWidget {
  const Separator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        height: 1.h,
        color: Colors.grey.withOpacity(0.5));
  }
}
