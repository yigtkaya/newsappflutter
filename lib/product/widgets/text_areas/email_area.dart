import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsappflutter/core/constants/app_colors.dart';
import 'package:newsappflutter/core/constants/app_constants.dart';
import 'package:newsappflutter/core/constants/app_design_constant.dart';
import 'package:newsappflutter/core/extensions/build_context_extension.dart';
import 'package:newsappflutter/core/extensions/language_extension.dart';

/// Email area.
final class EmailArea extends StatefulWidget {
  /// Constructor for EmailArea.
  const EmailArea({
    required this.controller,
    required this.onChanged,
    this.hint,
    super.key,
  });

  /// TextEditingController for the email area.
  final TextEditingController controller;

  /// VoidCallback for the email area.
  final VoidCallback onChanged;

  /// String for the email area.
  final String? hint;

  @override
  State<EmailArea> createState() => _EmailAreaState();
}

class _EmailAreaState extends State<EmailArea> {
  late FocusNode myFocusNode;
  bool focused = false;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode()
      ..addListener(
        () => setState(
          () => focused = myFocusNode.hasFocus,
        ),
      );
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      cursorColor: AppColors.kGrey,
      showCursor: true,
      focusNode: myFocusNode,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onChanged: (value) => widget.onChanged(),
      validator: (value) {
        if (value!.isEmpty) {
          return context.l10n.pleaseEnterEmail;
        } else if (!RegExp(AppConstants.emailRegex).hasMatch(value)) {
          return context.l10n.pleaseEnterValidEmail;
        }
        return null;
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: AppDesignConstants.spacingMedium,
          horizontal: AppDesignConstants.spacingMedium,
        ),
        hintText: widget.hint ?? 'Email',
        errorStyle: context.textTheme.bodyMedium!.copyWith(
          fontSize: 12.sp,
          fontWeight: FontWeight.normal,
          color: AppColors.kDanger500,
        ),
        hintStyle: context.textTheme.bodyMedium!.copyWith(
          color: AppColors.kSecondary400,
          fontSize: 14.sp,
        ),
        prefixIcon: Icon(
          LucideIcons.mail,
          color: AppColors.kSecondary400,
        ),
        fillColor: AppColors.kGreyDark,
        filled: true,
        border: _buildBorder(),
        focusedBorder: _buildBorder(),
        enabledBorder: _buildBorder(),
        errorBorder: _buildBorder(color: AppColors.kDanger500),
        disabledBorder: _buildBorder(),
        focusedErrorBorder: _buildBorder(color: AppColors.kDanger500),
      ),
      autofillHints: const [
        AutofillHints.email,
      ],
      style: context.textTheme.bodyMedium!.copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        color: AppColors.kSecondary900,
      ),
      autovalidateMode: AutovalidateMode.onUnfocus,
    );
  }

  InputBorder _buildBorder({Color? color}) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide.none,
      );
}
