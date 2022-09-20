part of '../../common.dart';

class GlobalSnackbar {
  static showSnackbar(
    String title, 
    String message, 
    Icon icons) {
      Get.snackbar(title, message, icon: icons, snackPosition: SnackPosition.TOP);
  }
}