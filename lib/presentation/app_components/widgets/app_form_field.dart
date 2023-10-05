import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../app_ui/app_color/app_color.dart';
import '../../app_ui/app_text/app_text.dart';

class AppFormField extends StatelessWidget {
  final String? fieldName;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final bool? readOnly;
  final String? initialValue;
  const AppFormField({
    this.fieldName,
    this.controller,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.onTap,
    this.readOnly,
    this.initialValue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 8),
          child: Text(
            fieldName ?? "",
            style: AppText.instance.medium_12px,
          ),
        ),
        TextFormField(
          onTap: onTap,
          initialValue: initialValue,
          readOnly: readOnly ?? false,
          style: AppText.instance.medium_12px,
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          onChanged: onChanged,
          textCapitalization: TextCapitalization.sentences,
          cursorColor: AppColor.instance.stockTrackerGreen,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: AppColor.instance.lightGrey,
                width: 2.w,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: AppColor.instance.lightGrey,
                width: 2.w,
              ),
            ),
            errorStyle: const TextStyle(height: 0),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: AppColor.instance.stockTrackerRed,
                width: 2.w,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: AppColor.instance.stockTrackerRed,
                width: 2.w,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
