import 'package:flutter/material.dart';
import 'package:hotel_clean/theme/colors.dart';
import 'package:hotel_clean/theme/text_styles.dart';

class EmailTextFormField extends StatefulWidget {
  const EmailTextFormField({
    super.key,
    required this.label,
    required this.hint,
  });
  final String label;
  final String hint;

  @override
  State<EmailTextFormField> createState() => _EmailTextFormFieldState();
}

class _EmailTextFormFieldState extends State<EmailTextFormField> {
  final TextEditingController controller = TextEditingController();
  Color fieldColor = AppColors.cF6F6F9;

  bool isEmailValid(String email) {
    final RegExp emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
    );
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: fieldColor,
        ),
        child: Focus(
          onFocusChange: (value) {
            if (value == false) {
              if (controller.text.isNotEmpty) {
                if (!isEmailValid(controller.text)) {
                  setState(() {
                    fieldColor = AppColors.cEB5757.withOpacity(0.15);
                  });
                } else {
                  setState(() {
                    fieldColor = AppColors.cF6F6F9;
                  });
                }
              }
            }
          },
          child: TextFormField(
            controller: controller,
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
      ),
    );
  }
}
