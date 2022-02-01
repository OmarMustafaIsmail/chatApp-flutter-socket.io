import 'package:flutter/material.dart';
import 'package:flutter_chatapp/controllers/camera_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AttachementsBottomSheet extends StatelessWidget {
  const AttachementsBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CameraController _cameraController = Get.find();
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width - 100,
      child: Card(
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.indigo,
                      child: Icon(Icons.insert_drive_file),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _cameraController.getImage(ImageSource.camera);
                    },
                    child: const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.pink,
                      child: Icon(Icons.camera_alt_rounded),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _cameraController.getImage(ImageSource.gallery);
                    },
                    child: const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.purple,
                      child: Icon(Icons.photo),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.orange,
                      child: Icon(Icons.headphones_rounded),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.green,
                      child: Icon(Icons.location_on),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.photo),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
