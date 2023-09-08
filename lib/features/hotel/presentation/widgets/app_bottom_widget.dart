import 'package:flutter/material.dart';
import 'package:hotel_clean/theme/colors.dart';

class AppBottomWidget extends StatelessWidget {
  const AppBottomWidget({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: AppColors.cE8E9EC),
        ),
      ),
      padding: const EdgeInsets.only(
        top: 12,
        left: 16,
        right: 16,
        bottom: 28,
      ),
      child: child,
    );
  }
}
