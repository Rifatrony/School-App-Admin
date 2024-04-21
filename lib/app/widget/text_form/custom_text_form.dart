import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextForm extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyBoardType;
  final IconData? suffixIcon;
  final VoidCallback? onPressSuffix;
  final bool? isReadOnly;
  final FormFieldValidator<String>? validator; // Validator function
  final int maxLine;

  const CustomTextForm({
    Key? key, // Change to Key? from super.key
    required this.controller,
    required this.hintText,
    this.keyBoardType = TextInputType.text,
    this.suffixIcon,
    this.onPressSuffix,
    this.isReadOnly = false,
    this.validator, // Validator function parameter
    this.maxLine = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      child: TextFormField(
        controller: controller,
        keyboardType: keyBoardType,
        readOnly: isReadOnly!,
        maxLines: maxLine,
        style: TextStyle(
          fontSize: 12.sp,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          suffixIcon: GestureDetector(
            onTap: onPressSuffix,
            child: Icon(suffixIcon),
          ),
        ),
        validator: validator, // Set the validator function
      ),
    );
  }
}
