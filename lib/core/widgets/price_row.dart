import 'package:flutter/material.dart';
import 'package:hotel_clean/theme/text_styles.dart';

class PriceRow extends StatelessWidget {
  const PriceRow({
    Key? key,
    this.price,
    this.description,
    this.isRoom = false,
  }) : super(key: key);
  final int? price;
  final String? description;
  final bool isRoom;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          isRoom ? '$price ₽' : 'от $price ₽',
          style: AppTextStyles.sfPro30w600.copyWith(height: 1),
        ),
        const SizedBox(width: 8),
        Text(
          description ?? 'за тур с перелетом',
          style: AppTextStyles.sfPro16w500,
        ),
      ],
    );
  }
}
