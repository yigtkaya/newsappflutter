import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newsappflutter/core/constants/app_colors.dart';

/// A widget that displays an icon from the asset folder.
final class AssetIcon extends StatelessWidget {
  /// Constructor for AssetIcon.
  const AssetIcon({
    required this.iconName,
    super.key,
    this.onPress,
    this.width,
    this.height,
    this.color,
  });

  /// The callback function to be called when the icon is pressed.
  final VoidCallback? onPress;

  /// The name of the icon to be displayed.
  final String iconName;

  /// The width of the icon.
  final double? width;

  /// The height of the icon.
  final double? height;

  /// The color of the icon.
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      splashColor: AppColors.kGrey,
      child: SizedBox(
        height: height,
        width: width,
        child: SvgPicture.asset(
          iconName,
        ),
      ),
    );
  }
}
