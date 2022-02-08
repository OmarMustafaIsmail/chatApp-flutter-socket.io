import 'package:flutter/material.dart';
import 'package:flutter_chatapp/controllers/single_chat_controller.dart';
import 'package:flutter_chatapp/models/message_mode.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketController extends GetxController {
  SingleChatController _controller = Get.put(SingleChatController());
  RxList<MessageModel> messages = <MessageModel>[].obs;

  IO.Socket? socket;

  @override
  void onInit() {
    connectSocket();
    super.onInit();
  }

  void sendMessage(String message, int sourceId, int targetId) {
    socket!.emit("message",
        {"message": message, "sourceId": sourceId, "targetId": targetId});
    setMessage("source", message);
    update();
  }

  void setMessage(String type, String message) {
    MessageModel messageModel = MessageModel(message: message, type: type);
    messages.add(messageModel);
    update();
  }

  void connectSocket() {
    socket = IO.io("http://192.168.1.5:3000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false
    });
    socket!.connect();
    socket!.onConnect((data) {
      print("connected");
      socket!.on("message", (msg) {
        setMessage("destination", msg["message"]);
        print(msg);
      });
    });
    socket!.emit("/signin", _controller.currentChat!.id);
  }
}
