import 'package:flutter/material.dart';
import 'package:hotel_clean/theme/colors.dart';
import 'package:hotel_clean/theme/text_styles.dart';

class AppChip extends StatelessWidget {
  const AppChip(
    this.text, {
    super.key,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 175,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.cFBFBFC,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            text,
            style: AppTextStyles.sfPro16w500,
            maxLines: 1,
          ),
        ),
      ),
    );
  }
}
