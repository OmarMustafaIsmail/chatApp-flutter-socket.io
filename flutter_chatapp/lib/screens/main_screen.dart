import 'package:flutter/material.dart';
import 'package:flutter_chatapp/controllers/camera_controller.dart';
import 'package:flutter_chatapp/screens/all_chats/all_chats_screen.dart';
import 'package:flutter_chatapp/screens/camera_screen/camera_page.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
            // ignore: prefer_const_constructors
            title: Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                left: 30,
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
                padding: const EdgeInsets.only(top: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: const Icon(Icons.search_rounded),
                ),
              ),
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
                SizedBox(
                  height: 15,
                  child: Tab(
                    icon: Icon(Icons.camera_alt_outlined),
                  ),
                ),
                Tab(
                  text: "Chats",
                ),
                Tab(text: "Status"),
              ],
            ),
          ),
          body: const TabBarView(
              children: [CameraPage(), AllChatsScreen(), AllChatsScreen()]),
        ),
      ),
    );
  }
}
