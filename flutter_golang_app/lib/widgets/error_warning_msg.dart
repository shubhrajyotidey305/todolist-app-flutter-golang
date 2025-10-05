import 'package:flutter/material.dart';
import 'package:flutter_golang_app/utils/app_colors.dart';
import 'package:get/get.dart';

class Message {
  static void taskErrorOrWarning(String taskName, String taskErrorOrWarning) {
    Get.snackbar(
      taskName,
      taskErrorOrWarning,
      backgroundColor: AppColors.mainColor,
      titleText: Text(
        taskName,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      messageText: Text(
        taskErrorOrWarning,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.amber,
        ),
      ),
    );
  }
}
