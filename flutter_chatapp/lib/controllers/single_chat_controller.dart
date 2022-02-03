import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SingleChatController extends GetxController {
  var isEmojiPickerVisible = true.obs;
  FocusNode focusNode = FocusNode();
  var sendButton = false.obs;

  TextEditingController textEditingController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    connectSocket();
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

  void connectSocket() {
    IO.Socket socket = IO.io("http://192.168.1.5:3000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false
    });
    socket.connect();
    socket.onConnect((data) => print("connected"));
    socket.emit("/test", "Hello from client side");
  }
}
