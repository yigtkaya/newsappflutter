import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsappflutter/core/constants/app_colors.dart';
import 'package:newsappflutter/core/extensions/build_context_extension.dart';
import 'package:newsappflutter/localization/cubit/language_cubit.dart';

/// Password area.
final class PasswordArea extends StatefulWidget {
  /// Constructor for PasswordArea.
  const PasswordArea({
    required this.controller,
    required this.onChanged,
    super.key,
    this.validator,
  });

  /// TextEditingController for the password area.
  final TextEditingController? controller;

  /// VoidCallback for the password area.
  final VoidCallback onChanged;

  /// FormFieldValidator for the password area.
  final FormFieldValidator<String>? validator;

  @override
  PasswordAreaState createState() => PasswordAreaState();
}

/// Password area state.
class PasswordAreaState extends State<PasswordArea> {
  late FocusNode _myFocusNode;

  /// Boolean for the password area.
  bool focused = false;

  /// Boolean for the password area.
  bool hidden = true;

  @override
  void initState() {
    super.initState();
    _myFocusNode = FocusNode()
      ..addListener(
        () => setState(
          () => focused = _myFocusNode.hasFocus,
        ),
      );
  }

  @override
  void dispose() {
    _myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      cursorColor: AppColors.kPrimary100,
      showCursor: true,
      focusNode: _myFocusNode,
      keyboardType: TextInputType.text,
      obscureText: hidden,
      obscuringCharacter: '*',
      onChanged: (value) => widget.onChanged(),
      validator: (value) {
        if (value!.isEmpty) {
          return context.l10n.pleaseEnterPassword;
        } else if (value.length < 8) {
          return context.l10n.aPasswordShouldBeAtLeast8Characters;
        }
        return null;
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: 16.h,
          horizontal: 16.w,
        ),
        hintText: context.l10n.password,
        errorStyle: context.textTheme.bodyMedium!.copyWith(
          fontSize: 12.sp,
          fontWeight: FontWeight.normal,
          color: AppColors.kDanger500,
        ),
        hintStyle: context.textTheme.bodyMedium!.copyWith(
          color: AppColors.kSecondary400,
          fontSize: 14.sp,
        ),
        fillColor: AppColors.kGreyDark,
        filled: true,
        border: _buildBorder(),
        focusedBorder: _buildBorder(),
        enabledBorder: _buildBorder(),
        errorBorder: _buildBorder(color: AppColors.kDanger500),
        disabledBorder: _buildBorder(),
        focusedErrorBorder: _buildBorder(color: AppColors.kDanger500),
        prefixIcon: Icon(
          LucideIcons.lock,
          color: AppColors.kSecondary400,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            hidden ? LucideIcons.eye_off : LucideIcons.eye,
            color: AppColors.kSecondary400,
          ),
          onPressed: () => setState(() => hidden = !hidden),
        ),
      ),
      style: context.textTheme.bodyMedium!.copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        color: AppColors.kSecondary900,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  InputBorder _buildBorder({Color? color}) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide.none,
      );
}
