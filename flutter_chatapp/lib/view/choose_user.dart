import 'package:flutter/material.dart';
import 'package:flutter_chatapp/controllers/single_chat_controller.dart';
import 'package:flutter_chatapp/models/chat_model.dart';
import 'package:flutter_chatapp/view/buttons_card.dart';
import 'package:flutter_chatapp/view/main_screen.dart';
import 'package:get/get.dart';

class ChooseUserScreen extends StatelessWidget {
  const ChooseUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SingleChatController controller = Get.put(SingleChatController());
    ChatModel currentUser;
    List<ChatModel> chats = [
      ChatModel(
          id: 1,
          name: "Omar Mustafa",
          message: "how are you??",
          icon: "user.svg",
          isGroup: false,
          time: "4:00"),
      ChatModel(
          id: 2,
          name: "Ibrahim Hassan",
          message: "I'll come visit you today",
          icon: "user.svg",
          isGroup: false,
          time: "8:00"),
      ChatModel(
          id: 3,
          name: "Ahmed Tarek",
          message: "Did you finish the essay for...",
          icon: "user.svg",
          isGroup: false,
          time: "11:30"),
    ];
    return Scaffold(
      body: GestureDetector(
        onTap: () {},
        child: ListView.builder(
          itemCount: chats.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              currentUser = chats.removeAt(index);
              Get.to(() => MainScreen(chats: chats));
              controller.currentChat = currentUser;
              print(currentUser.id);
            },
            child:
                ButtonsCard(icon: Icon(Icons.person), name: chats[index].name!),
          ),
        ),
      ),
    );
  }
}
