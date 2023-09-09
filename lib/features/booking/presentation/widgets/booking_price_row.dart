import 'package:flutter/material.dart';
import 'package:hotel_clean/theme/colors.dart';
import 'package:hotel_clean/theme/text_styles.dart';

class BookingPriceRow extends StatelessWidget {
  const BookingPriceRow({
    super.key,
    required this.text1,
    required this.text2,
    this.isLast = false,
  });
  final String text1;
  final String text2;
  final bool isLast;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            child: Text(
              text1,
              style: AppTextStyles.sfPro16w500.copyWith(
                  color: AppColors.c828796, fontWeight: FontWeight.w400),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            child: Text(
              text2,
              textAlign: TextAlign.end,
              style: AppTextStyles.sfPro16w500.copyWith(
                  color: isLast ? AppColors.c0D72FF : Colors.black,
                  fontWeight: isLast ? FontWeight.w600 : FontWeight.w400),
            ),
          ),
        ),
      ],
    );
  }
}
