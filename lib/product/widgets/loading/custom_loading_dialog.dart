import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:newsappflutter/core/constants/app_colors.dart';
import 'package:newsappflutter/core/constants/app_design_constant.dart';

/// Custom loading dialog.
final class CustomLoadingDialog extends StatelessWidget {
  /// Constructor for CustomLoadingDialog.
  const CustomLoadingDialog({super.key});

  /// Show the loading dialog.
  static Future<T> show<T>({
    required BuildContext context,
    required Future<T> future,
  }) async {
    unawaited(
      showDialog(
        context: context,
        builder: (context) => const CustomLoadingDialog(),
      ),
    );

    final result = await future;

    return result;
  }

  @override
  Widget build(BuildContext context) {
    final spinkit = SpinKitSquareCircle(
      color: AppColors.kPrimary100,
      size: 30,
    );

    return Dialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: AppDesignConstants.spacingMedium,
        children: [
          spinkit,
          const Text('Please wait...'),
        ],
      ),
    );
  }
}
