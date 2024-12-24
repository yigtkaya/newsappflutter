import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newsappflutter/core/constants/app_colors.dart';
import 'package:newsappflutter/core/extensions/build_context_extension.dart';

/// Custom toast message widget.
final class CustomToastMessage extends StatelessWidget {
  /// Constructor for CustomToastMessage.
  const CustomToastMessage({
    required this.message,
    super.key,
    this.bgColor,
    this.textColor = Colors.white,
  });

  /// Background color of the toast.
  final Color? bgColor;

  /// Text color of the toast.
  final Color? textColor;

  /// Message to display.
  final String? message;

  /// Show custom toast.
  static void showCustomToast(
    BuildContext context,
    String message,
    Color bgColor,
  ) {
    FToast().init(context).showToast(
          toastDuration: const Duration(seconds: 3),
          gravity: ToastGravity.TOP,
          child: CustomToastMessage(
            message: message,
            bgColor: bgColor,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 45),
      child: Container(
        decoration: BoxDecoration(
          color: bgColor ?? AppColors.kInfo500,
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 16.h,
        ),
        child: Text(
          message ?? '',
          textAlign: TextAlign.center,
          style: context.textTheme.bodyMedium!.copyWith(
            color: textColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
