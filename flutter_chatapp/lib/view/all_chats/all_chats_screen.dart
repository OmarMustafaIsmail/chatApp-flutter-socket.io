import 'package:flutter/material.dart';
import 'package:flutter_chatapp/models/chat_model.dart';

import 'components/chat_list_tile.dart';

class AllChatsScreen extends StatelessWidget {
  AllChatsScreen({required this.chats});
  List<ChatModel> chats;
  @override
  Widget build(BuildContext context) {
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
