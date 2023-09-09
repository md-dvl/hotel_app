import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_clean/theme/text_styles.dart';

class AppAppBar extends StatelessWidget {
  const AppAppBar(
    this.text, {
    super.key,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: SizedBox(
                height: 32,
                width: 32,
                child: SvgPicture.asset('assets/svg/arrow_left.svg'),
              ),
            ),
            Text(
              text,
              style: AppTextStyles.sfPro18w500,
            ),
            const SizedBox(
              height: 32,
              width: 32,
            ),
          ],
        ),
      ),
    );
  }
}
