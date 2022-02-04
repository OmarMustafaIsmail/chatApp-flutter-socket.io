import 'package:flutter/material.dart';
import 'package:flutter_chatapp/controllers/camera_controller.dart';
import 'package:flutter_chatapp/models/chat_model.dart';

import 'package:flutter_chatapp/view/all_chats/all_chats_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({
    required this.chats,
  });
  List<ChatModel> chats;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(Icons.search_rounded),
              ),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
            // ignore: prefer_const_constructors
            title: Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                left: 0,
              ),
              child: const Center(
                child: Text(
                  "TALK",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            actions: [
              Padding(
                  padding: const EdgeInsets.only(top: 18.0, right: 10.0),
                  child: PopupMenuButton<String>(
                    onSelected: (value) => print(value),
                    itemBuilder: (context) {
                      return [
                        const PopupMenuItem<String>(
                          child: Text("Profile Settings"),
                          value: "Settings",
                        ),
                        const PopupMenuItem<String>(
                          child: Text("Starred Messages"),
                          value: "Starred Messages",
                        ),
                      ];
                    },
                  )),
            ],
            bottom: const TabBar(
              labelColor: Colors.black,
              indicatorColor: Colors.black,
              tabs: [
                Tab(
                  text: "Chats",
                ),
                Tab(text: "Status"),
              ],
            ),
          ),
          body: TabBarView(children: [
            AllChatsScreen(
              chats: chats,
            ),
            AllChatsScreen(
              chats: [],
            )
          ]),
        ),
      ),
    );
  }
}
