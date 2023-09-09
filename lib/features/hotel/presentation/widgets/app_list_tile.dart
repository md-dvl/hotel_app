import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_clean/features/hotel/data/models/list_tile_model.dart';
import 'package:hotel_clean/theme/colors.dart';
import 'package:hotel_clean/theme/text_styles.dart';

class AppListTile extends StatelessWidget {
  const AppListTile(
    this.model, {
    Key? key,
  }) : super(key: key);
  final ListTileModel model;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 2,
            right: 14,
          ),
          child: SvgPicture.asset(model.icon),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.title,
              style:
                  AppTextStyles.sfPro16w500.copyWith(color: AppColors.c2C3035),
            ),
            const SizedBox(height: 2),
            Text(
              model.subtitle,
              style:
                  AppTextStyles.sfPro14w500.copyWith(color: AppColors.c828796),
            )
          ],
        ),
        const Spacer(),
        SvgPicture.asset('assets/svg/arrow_right.svg'),
      ],
    );
  }
}
