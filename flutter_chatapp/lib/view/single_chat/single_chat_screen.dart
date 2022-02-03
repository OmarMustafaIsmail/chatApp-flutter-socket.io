import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatapp/controllers/camera_controller.dart';
import 'package:flutter_chatapp/controllers/single_chat_controller.dart';
import 'package:flutter_chatapp/models/chat_model.dart';
import 'package:flutter_chatapp/view/single_chat/components/received_message.dart';
import 'package:flutter_chatapp/view/single_chat/components/sent_message.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'components/attachments_bottomsheet.dart';

class SingleChatScreen extends StatelessWidget {
  const SingleChatScreen({required this.chatModel, Key? key}) : super(key: key);
  final ChatModel chatModel;
  @override
  Widget build(BuildContext context) {
    final CameraController _cameraController = Get.find();
    final SingleChatController _controller = Get.find();
    return Stack(
      children: [
        Image.asset(
          "assets/whtasapp_background.png",
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Center(
              child: GestureDetector(
                onTap: () => _GetDialog(chatModel),
                child: Text(
                  chatModel.name!,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
            elevation: 0,
            backgroundColor: Colors.white,
            leading: Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            // ignore: prefer_const_literals_to_create_immutables
            actions: [
              const Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Icon(Icons.add_call, color: Colors.blue),
              )
            ],
          ),
          body: WillPopScope(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          SentMessage(),
                          ReceivedMessage(),
                          SentMessage(),
                          ReceivedMessage(),
                          SentMessage(),
                          ReceivedMessage(),
                          SentMessage(),
                          ReceivedMessage()
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 70,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width - 55,
                                  child: Card(
                                    shadowColor: Colors.transparent,
                                    margin: const EdgeInsets.only(
                                        bottom: 8, left: 7, right: 7),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: TextFormField(
                                      controller:
                                          _controller.textEditingController,
                                      focusNode: _controller.focusNode,
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 5,
                                      minLines: 1,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Type a message",
                                        prefixIcon: GestureDetector(
                                          child: const Icon(
                                            Icons.emoji_emotions,
                                            color: Colors.grey,
                                          ),
                                          onTap: () {
                                            _controller.isEmojiPickerVisible
                                                    .value =
                                                !_controller
                                                    .isEmojiPickerVisible.value;
                                            _controller.focusNode.unfocus();
                                            _controller.focusNode
                                                .canRequestFocus = true;
                                          },
                                        ),
                                        suffixIcon: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                showModalBottomSheet(
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    context: context,
                                                    builder: (BuildContext
                                                            context) =>
                                                        const AttachementsBottomSheet());
                                              },
                                              icon: const Icon(
                                                Icons.attach_file,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                _cameraController.getImage(
                                                    ImageSource.camera);
                                              },
                                              icon: const Icon(Icons.camera_alt,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 8,
                                    right: 3,
                                    left: 2,
                                  ),
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Colors.blue,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.mic,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Obx(
                              () => Offstage(
                                offstage:
                                    _controller.isEmojiPickerVisible.value,
                                child: SizedBox(
                                  height: 250,
                                  child: EmojiPicker(
                                      onEmojiSelected: (category, emoji) {
                                    _controller.textEditingController.text =
                                        _controller.textEditingController.text +
                                            emoji.emoji;
                                  }),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            onWillPop: () {
              if (!_controller.isEmojiPickerVisible.value) {
                _controller.isEmojiPickerVisible.value = true;
              } else {
                Get.back();
              }
              return Future.value(false);
            },
          ),
        ),
      ],
    );
  }
}

_GetDialog(ChatModel chatModel) {
  return Get.defaultDialog(
    title: chatModel.name!,
    content: CircleAvatar(
      backgroundColor: Colors.grey,
      child: SvgPicture.asset(
        "assets/${chatModel.icon}",
        width: 50,
      ),
      radius: 50.0,
    ),
    middleText: "",
    titlePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
  );
}
