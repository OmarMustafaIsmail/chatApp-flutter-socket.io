import 'package:flutter/material.dart';
import 'package:flutter_chatapp/controllers/single_chat_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketController extends GetxController {
  SingleChatController _controller = Get.put(SingleChatController());

  IO.Socket? socket;

  @override
  void onInit() {
    connectSocket();
    super.onInit();
  }

  void sendMessage(String message, int sourceId, int targetId) {
    socket!.emit("message",
        {"message": message, "sourceId": sourceId, "targetId": targetId});
  }

  void connectSocket() {
    socket = IO.io("http://192.168.1.5:3000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false
    });
    socket!.connect();
    socket!.onConnect((data) => print("connected"));
    socket!.emit("/signin", _controller.currentChat!.id);
  }
}
