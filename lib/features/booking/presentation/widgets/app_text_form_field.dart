import 'package:flutter/material.dart';
import 'package:hotel_clean/theme/colors.dart';
import 'package:hotel_clean/theme/text_styles.dart';

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    super.key,
    required this.hint,
    this.label,
  });

  final String hint;
  final String? label;

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  Color fieldColor = AppColors.cF6F6F9;
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: fieldColor,
        ),
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              setState(() {
                fieldColor = AppColors.cEB5757.withOpacity(0.15);
              });
              return '';
            } else {
              setState(() {
                fieldColor = AppColors.cF6F6F9;
              });
              return null;
            }
          },
          controller: controller,
          style: const TextStyle(height: 1),
          decoration: widget.label == null
              ? InputDecoration(
                  errorStyle: const TextStyle(height: 0),
                  hintText: widget.hint,
                  hintStyle: AppTextStyles.sfPro17w400,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 16,
                  ),
                  border: InputBorder.none,
                )
              : InputDecoration(
                  errorStyle: const TextStyle(height: 0),
                  alignLabelWithHint: true,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: widget.label,
                  labelStyle: AppTextStyles.sfPro12w400,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 16,
                  ),
                  border: InputBorder.none,
                  hintText: widget.hint,
                  hintStyle: AppTextStyles.sfPro16w400,
                ),
        ),
      ),
    );
  }
}
