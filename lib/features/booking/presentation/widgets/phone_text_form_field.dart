import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotel_clean/theme/colors.dart';
import 'package:hotel_clean/theme/text_styles.dart';

class PhoneTextFormField extends StatefulWidget {
  const PhoneTextFormField({
    super.key,
    required this.label,
    required this.hint,
    required this.formatter,
  });
  final String label;
  final String hint;
  final TextInputFormatter formatter;
  @override
  State<PhoneTextFormField> createState() => _PhoneTextFormFieldState();
}

class _PhoneTextFormFieldState extends State<PhoneTextFormField> {
  Color fieldColor = AppColors.cF6F6F9;
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
          inputFormatters: [widget.formatter],
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
          style: const TextStyle(height: 1),
          decoration: InputDecoration(
            alignLabelWithHint: true,
            errorStyle: const TextStyle(height: 0),
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
