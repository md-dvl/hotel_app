import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_clean/theme/colors.dart';

class SmallButtonContainer extends StatelessWidget {
  const SmallButtonContainer({
    required this.icon,
    this.isArrow = true,
    super.key,
  });
  final bool isArrow;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: AppColors.c0D72FF.withOpacity(isArrow ? 0.1 : 1),
      ),
      child: Center(
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
