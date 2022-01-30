import 'package:flutter/material.dart';
import 'package:flutter_chatapp/screens/all_chats/components/chat_list_tile.dart';

class AllChatsScreen extends StatelessWidget {
  const AllChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [ChatListTile(), ChatListTile()],
    );
  }
}
