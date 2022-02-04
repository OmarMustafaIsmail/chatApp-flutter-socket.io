import 'package:flutter/material.dart';

class ButtonsCard extends StatelessWidget {
  ButtonsCard({required this.icon, required this.name, Key? key})
      : super(key: key);
  String name;
  Icon icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.green,
        child: icon,
      ),
      title: Text(name),
    );
  }
}
