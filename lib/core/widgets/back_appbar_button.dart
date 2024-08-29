import 'package:flutter/material.dart';
import 'package:todo/core/theming/colors.dart';

class AppBarBackButtom extends StatelessWidget {
  const AppBarBackButtom({super.key, this.onTap});
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ??
          () {
            Navigator.pop(context);
          },
      child: const Icon(
        Icons.arrow_back,
        color: AppColors.primaryColor,
      ),
    );
  }
}
