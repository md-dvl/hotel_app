import 'package:flutter/material.dart';
import 'package:hotel_clean/features/booking/presentation/widgets/app_text_form_field.dart';
import 'package:hotel_clean/features/booking/presentation/widgets/small_button_container.dart';
import 'package:hotel_clean/theme/text_styles.dart';

class ExpandableColumn extends StatefulWidget {
  const ExpandableColumn(
    this.text, {
    super.key,
  });
  final String text;
  @override
  State<ExpandableColumn> createState() => _ExpandableColumnState();
}

class _ExpandableColumnState extends State<ExpandableColumn> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => setState(() {
            _isExpanded = !_isExpanded;
          }),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.text,
                style: AppTextStyles.sfPro22w500,
              ),
              SmallButtonContainer(
                  icon: _isExpanded
                      ? 'assets/svg/arrow_up.svg'
                      : 'assets/svg/arrow_down.svg')
            ],
          ),
        ),
        // if (_isExpanded)
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 300),
          firstChild: const SizedBox.shrink(),
          crossFadeState: _isExpanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          secondChild: const Column(
            children: [
              SizedBox(height: 17),
              AppTextFormField(label: 'Имя', hint: 'Иван'),
              SizedBox(height: 8),
              AppTextFormField(label: 'Фамилия', hint: 'Иванов'),
              SizedBox(height: 8),
              AppTextFormField(hint: 'Дата рождения'),
              SizedBox(height: 8),
              AppTextFormField(hint: 'Гражданство'),
              SizedBox(height: 8),
              AppTextFormField(hint: 'Номер загранпаспорта'),
              SizedBox(height: 8),
              AppTextFormField(hint: 'Срок действия загранпаспорта'),
            ],
          ),
          firstCurve: Curves.easeOut,
          secondCurve: Curves.easeIn,
        ),
      ],
    );
  }
}
