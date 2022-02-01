import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleChatController extends GetxController {
  var isEmojiPickerVisible = true.obs;
  FocusNode focusNode = FocusNode();
  TextEditingController textEditingController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        isEmojiPickerVisible.value = true;
      }
    });
  }

  @override
  void onClose() {
    textEditingController.dispose();
    super.onClose();
  }
}
