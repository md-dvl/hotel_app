import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_clean/theme/colors.dart';
import 'package:hotel_clean/theme/text_styles.dart';

class HotelDetailsColumn extends StatelessWidget {
  const HotelDetailsColumn({
    super.key,
    this.rating,
    this.ratingName,
    this.name,
    this.adress,
  });
  final int? rating;
  final String? ratingName;
  final String? name;
  final String? adress;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColors.cFFC700.withOpacity(0.2),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset('assets/svg/star.svg'),
              const SizedBox(width: 2),
              Text(
                '$rating $ratingName',
                style: AppTextStyles.sfPro16w500
                    .copyWith(color: AppColors.cFFA800),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            name ?? 'Steigenberger Makadi',
            style: AppTextStyles.sfPro22w500,
          ),
        ),
        InkWell(
          child: Text(
            adress ?? 'Madinat Makadi, Safaga Road, Makadi Bay, Египет',
            style: AppTextStyles.sfPro14w500,
          ),
        ),
      ],
    );
  }
}
