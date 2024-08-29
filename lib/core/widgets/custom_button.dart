import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;
  final BorderSide? borderSide;
  final double? elevation;
  final bool? enableShadow;
  final bool? isEnabled;
  final List<Color>? gradientColors;
  final IconData? iconData;
  final List<BoxShadow>? boxShadow;
  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.color,
    this.textColor,
    this.fontSize = 20,
    this.fontWeight,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.borderRadius = 20.0,
    this.borderSide,
    this.elevation,
    this.enableShadow,
    this.isEnabled,
    this.boxShadow,
    this.gradientColors,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: padding ??
            EdgeInsets.symmetric(
              horizontal: 12.0.sp,
              vertical: 8.0.sp,
            ),
        width: width ?? MediaQuery.of(context).size.width * 0.9,
        // height: height ?? 40.sp,
        margin: margin,
        decoration: BoxDecoration(
          // gradient: color == null
          //     ? liner
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: borderSide?.color ?? Colors.transparent),
          color: color ?? const Color(0xff8E91F4),
          boxShadow: boxShadow ??
              [
                // BoxShadow(
                //   color: Colors.grey.withOpacity(0.3),
                //   spreadRadius: -1,
                //   blurRadius: 5.sp,
                // ),
              ],
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (iconData != null)
                Icon(
                  iconData,
                  color: textColor ?? Colors.white,
                  size: 15.sp,
                ),
              Text(
                text,
                style: TextStyle(
                  color: textColor ?? Colors.white,
                  fontSize: fontSize ?? 16.sp,
                  fontWeight: fontWeight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
