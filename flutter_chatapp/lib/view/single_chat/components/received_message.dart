import 'package:flutter/material.dart';

class ReceivedMessage extends StatelessWidget {
  ReceivedMessage({required this.message, Key? key}) : super(key: key);
  String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 45),
        child: Card(
          color: Colors.black54,
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Stack(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 60, top: 15, bottom: 20),
                child: Text(
                  message,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              const Positioned(
                right: 20,
                bottom: 10,
                child: Text(
                  "4:10",
                  style: TextStyle(color: Colors.white),
                ),
                // ignore: prefer_const_literals_to_create_immutables
              ),
            ],
          ),
        ),
      ),
    );
  }
}
