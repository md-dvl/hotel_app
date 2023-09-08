import 'package:flutter/material.dart';
import 'package:hotel_clean/theme/colors.dart';
import 'package:hotel_clean/theme/text_styles.dart';

class AppTextWidget extends StatelessWidget {
  const AppTextWidget(
    this.text, {
    super.key,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.c0D72FF,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              text,
              style: AppTextStyles.sfPro16w500letter,
            ),
          ),
        ),
      ],
    );
  }
}
