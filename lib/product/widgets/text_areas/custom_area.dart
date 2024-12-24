import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsappflutter/core/constants/app_colors.dart';
import 'package:newsappflutter/core/extensions/build_context_extension.dart';

/// Custom text field.
final class CustomTextField extends StatefulWidget {
  /// Custom text field constructor.
  const CustomTextField({
    super.key,
    this.controller,
    this.inputType,
    this.labelText,
    this.prefixText,
    this.maxLines,
    this.maxLength,
    this.validator,
    this.inputFormatters,
    this.onChanged,
    this.hasCurrencySymbol,
    this.enabled,
    this.suffixText,
    this.hintText,
    this.hasSearchIcon,
    this.suffixIcon,
    this.prefixIcon,
    this.readOnly,
    this.autofocus,
    this.focusNode,
  });

  /// Controller.
  final TextEditingController? controller;

  /// Input type.
  final TextInputType? inputType;

  /// Label text.
  final String? labelText, prefixText, suffixText, hintText;

  /// Has currency symbol.
  final bool? hasCurrencySymbol;

  /// Max lines.
  final int? maxLines, maxLength;

  /// Validator.
  final FormFieldValidator<String>? validator;

  /// Input formatters.
  final List<TextInputFormatter>? inputFormatters;

  /// On changed.
  final ValueChanged<String>? onChanged;

  /// Enabled.
  final bool? enabled;

  /// Autofocus.
  final bool? autofocus;

  /// Has search icon.
  final bool? hasSearchIcon;

  /// Suffix icon.
  final Widget? suffixIcon;

  /// Prefix icon.
  final Widget? prefixIcon;

  /// Read only.
  final bool? readOnly;

  /// Focus node.
  final FocusNode? focusNode;
  @override
  State<StatefulWidget> createState() => TextFieldState();
}

/// Text field state.
class TextFieldState extends State<CustomTextField> {
  /// Focus node.
  late FocusNode myFocusNode;

  /// Focused.
  bool focused = false;

  /// Is empty.
  bool isEmpty = true;

  @override
  void initState() {
    super.initState();
    myFocusNode = widget.focusNode ?? FocusNode()
      ..addListener(() => setState(() => focused = myFocusNode.hasFocus));
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUnfocus,
      autofocus: widget.autofocus ?? false,
      readOnly: widget.readOnly ?? false,
      textInputAction: TextInputAction.next,
      style: context.textTheme.bodyMedium!.copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        color: AppColors.kSecondary900,
      ),
      cursorColor: AppColors.kPrimary100,
      enabled: widget.enabled,
      focusNode: myFocusNode,
      controller: widget.controller,
      keyboardType: widget.inputType,
      onChanged: (value) {
        setState(() => isEmpty = value.isEmpty);
        widget.onChanged?.call(value);
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: 16.h,
          horizontal: 16.w,
        ),
        hintText: widget.hintText,
        prefixText: widget.prefixText,
        suffixText: widget.suffixText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
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
      ),
      maxLines: widget.maxLines ?? 1,
      maxLength: widget.maxLength,
      validator: widget.validator,
      inputFormatters: widget.inputFormatters,
    );
  }

  InputBorder _buildBorder({Color? color}) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide.none,
      );
}
