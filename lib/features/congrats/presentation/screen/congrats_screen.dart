import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hotel_clean/core/constants/constants.dart';
import 'package:hotel_clean/core/widgets/app_app_bar.dart';
import 'package:hotel_clean/core/widgets/app_bottom_widget.dart';
import 'package:hotel_clean/core/widgets/app_text_widget.dart';
import 'package:hotel_clean/features/hotel/presentation/screens/hotel_screen.dart';
import 'package:hotel_clean/theme/colors.dart';
import 'package:hotel_clean/theme/text_styles.dart';

class CongratsScreen extends StatelessWidget {
  const CongratsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppAppBar('Заказ оплачен'),
            const SizedBox(height: 127),
            SizedBox(
              height: 94,
              width: 94,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.cF6F6F9,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: SizedBox(
                    height: 44,
                    width: 44,
                    child: Image.asset('assets/png/congrats.png'),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'Ваш заказ принят в работу',
              style: AppTextStyles.sfPro22w500,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: SizedBox(
                width: 320,
                child: Text(
                  generateOrder(),
                  style: AppTextStyles.sfPro16w500
                      .copyWith(fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const Spacer(),
            AppBottomWidget(
              child: GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HotelScreen(),
                  ),
                ),
                child: const AppTextWidget('Супер!'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String generateOrder() {
  int randomNumber = Random().nextInt(900000) + 100000;
  return ('${AppConstants.order}$randomNumber${AppConstants.order2}');
}
