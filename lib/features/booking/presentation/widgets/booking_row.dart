import 'package:flutter/material.dart';
import 'package:hotel_clean/theme/colors.dart';
import 'package:hotel_clean/theme/text_styles.dart';

class BookingRow extends StatelessWidget {
  const BookingRow({
    super.key,
    required this.text1,
    required this.text2,
  });
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 416,
          child: SizedBox(
            child: Text(
              text1,
              style: AppTextStyles.sfPro16w500.copyWith(
                  color: AppColors.c828796, fontWeight: FontWeight.w400),
            ),
          ),
        ),
        Expanded(
          flex: 584,
          child: SizedBox(
            child: Text(
              text2,
              style: AppTextStyles.sfPro16w500
                  .copyWith(color: Colors.black, fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ],
    );
  }
}
