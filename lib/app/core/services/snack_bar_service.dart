import 'package:flutter/material.dart';
import 'package:new_store/app/core/widgets/text_widget.dart';

class SnackBarService {
  static void showError({
    required BuildContext context,
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 8),
      backgroundColor: Colors.redAccent,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextWidget(
            text: message,
            textAlign: TextAlign.center,
          )
        ],
      ),
    ));
  }

  static void showSuccess({
    required BuildContext context,
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 8),
      backgroundColor: Colors.greenAccent,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextWidget(
            text: message,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ));
  }
}
