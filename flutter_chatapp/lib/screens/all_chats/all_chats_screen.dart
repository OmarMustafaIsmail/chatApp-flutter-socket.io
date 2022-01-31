import 'package:flutter/material.dart';
import 'package:flutter_chatapp/models/chat_model.dart';
import 'package:flutter_chatapp/screens/all_chats/components/chat_list_tile.dart';

class AllChatsScreen extends StatelessWidget {
  const AllChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ChatModel> chats = [
      ChatModel(
          name: "Omar Mustafa",
          message: "how are you??",
          icon: "user.svg",
          isGroup: false,
          time: "4:00"),
      ChatModel(
          name: "Ibrahim Hassan",
          message: "I'll come visit you today",
          icon: "user.svg",
          isGroup: false,
          time: "8:00"),
      ChatModel(
          name: "Ahmed Tarek",
          message: "Did you finish the essay for...",
          icon: "user.svg",
          isGroup: false,
          time: "11:30"),
      ChatModel(
          name: "So7ab Walla A3az",
          message: "HAHAHAHAHAHAHA",
          icon: "groups.svg",
          isGroup: true,
          time: "12:00"),
    ];
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.chat),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) => ChatListTile(
            chatModel: chats[index],
          ),
          itemCount: chats.length,
        ));
  }
}
