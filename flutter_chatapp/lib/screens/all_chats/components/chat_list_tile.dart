import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChatListTile extends StatelessWidget {
  const ChatListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 30.0,
              child: SvgPicture.asset(
                "assets/user.svg",
                width: 30,
                color: Colors.white,
              ),
            ),
            trailing: const Text("18:00"),
            title: const Text(
              "Omar Mustafa",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            subtitle: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Icon(Icons.done_all),
                const Text("Hi Omar how ar you?!!!")
              ],
            ),
          ),
        ),
        Divider(
          thickness: 1,
        )
      ],
    );
  }
}
