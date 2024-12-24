import 'package:flutter/material.dart';
import 'package:newsappflutter/product/widgets/loading/custom_loading_dialog.dart';

/// Extension for future.
extension FutureExtension<T> on Future<T> {
  /// Make the future with loading dialog.
  Future<T> makeWithLoadingDialog({
    required BuildContext context,
  }) async {
    final result = await CustomLoadingDialog.show<T>(
      context: context,
      future: this,
    );

    return result;
  }
}
