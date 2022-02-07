import 'package:flutter/material.dart';
import 'package:flutter_chatapp/models/chat_model.dart';
import 'package:get/get.dart';

class SingleChatController extends GetxController {
  var isEmojiPickerVisible = true.obs;
  FocusNode focusNode = FocusNode();

  ChatModel? currentChat = ChatModel(
      id: 1,
      name: "Omar Mustafa",
      message: "how are you??",
      icon: "user.svg",
      isGroup: false,
      time: "4:00");

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
