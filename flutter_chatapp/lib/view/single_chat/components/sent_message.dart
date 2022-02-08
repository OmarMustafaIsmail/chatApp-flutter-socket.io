import 'package:flutter/material.dart';

class SentMessage extends StatelessWidget {
  SentMessage({required this.message, Key? key}) : super(key: key);
  String? message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 45),
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 80, top: 15, bottom: 20),
                child: Text(
                  message!,
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              Positioned(
                right: 10,
                bottom: 10,
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      "4:10",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.done_all,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
