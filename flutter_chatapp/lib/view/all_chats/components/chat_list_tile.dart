import 'package:flutter/material.dart';
import 'package:flutter_chatapp/models/chat_model.dart';
import 'package:flutter_chatapp/view/single_chat/single_chat_screen.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ChatListTile extends StatelessWidget {
  const ChatListTile({required this.chatModel, Key? key}) : super(key: key);
  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => SingleChatScreen(
            chatModel: chatModel,
          )),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 30.0,
                child: SvgPicture.asset(
                  "assets/${chatModel.icon}",
                  width: 30,
                  color: Colors.white,
                ),
              ),
              trailing: Text(chatModel.time!),
              title: Text(
                chatModel.name!,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              subtitle: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Icon(Icons.done_all),
                  Text(chatModel.message!)
                ],
              ),
            ),
          ),
          Divider(
            thickness: 1,
          )
        ],
      ),
    );
  }
}
