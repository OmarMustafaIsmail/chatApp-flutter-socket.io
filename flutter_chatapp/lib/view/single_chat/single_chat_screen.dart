import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatapp/controllers/camera_controller.dart';
import 'package:flutter_chatapp/controllers/sicket.io_controller.dart';
import 'package:flutter_chatapp/controllers/single_chat_controller.dart';
import 'package:flutter_chatapp/models/chat_model.dart';
import 'package:flutter_chatapp/view/single_chat/components/received_message.dart';
import 'package:flutter_chatapp/view/single_chat/components/sent_message.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'components/attachments_bottomsheet.dart';

class SingleChatScreen extends StatefulWidget {
  const SingleChatScreen({required this.chatModel, Key? key}) : super(key: key);
  final ChatModel chatModel;

  @override
  State<SingleChatScreen> createState() => _SingleChatScreenState();
}

class _SingleChatScreenState extends State<SingleChatScreen> {
  late bool isbuttonVisible = false;
  late SingleChatController _singleChatcontroller;

  @override
  void initState() {
    print('MESSAGE BOARD');
    super.initState();
    _singleChatcontroller = Get.put(SingleChatController());
  }

  @override
  Widget build(BuildContext context) {
    final CameraController _cameraController = Get.find();
    final SocketController _socketChatcontroller = Get.put(SocketController());

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
                onTap: () => _GetDialog(widget.chatModel),
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Text(widget.chatModel.name!,
                      style: const TextStyle(
                        color: Colors.black,
                      )),
                ),
              ),
            ),
            elevation: 0,
            backgroundColor: Colors.white,
            leading: Padding(
              padding: const EdgeInsets.only(left: 0.0, top: 5),
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
                      child: Obx(() => ListView.builder(
                          shrinkWrap: true,
                          itemCount: _socketChatcontroller.messages.length,
                          itemBuilder: (context, index) {
                            if (_socketChatcontroller.messages[index].type ==
                                "source") {
                              return SentMessage(
                                message: _socketChatcontroller
                                    .messages[index].message,
                              );
                            } else {
                              return ReceivedMessage(
                                message: _socketChatcontroller
                                    .messages[index].message!,
                              );
                            }
                          })),
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
                                      onChanged: (value) {
                                        if (value.trim().isNotEmpty) {
                                          setState(() {
                                            isbuttonVisible = true;
                                          });
                                        } else if (value.trim().isEmpty) {
                                          setState(() {
                                            isbuttonVisible = false;
                                          });
                                        }
                                      },
                                      controller: _singleChatcontroller
                                          .textEditingController,
                                      focusNode:
                                          _singleChatcontroller.focusNode,
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
                                            _singleChatcontroller
                                                    .isEmojiPickerVisible
                                                    .value =
                                                !_singleChatcontroller
                                                    .isEmojiPickerVisible.value;
                                            _singleChatcontroller.focusNode
                                                .unfocus();
                                            _singleChatcontroller.focusNode
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
                                        contentPadding: EdgeInsets.all(5),
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
                                    child: isbuttonVisible
                                        ? IconButton(
                                            onPressed: () {
                                              _socketChatcontroller.sendMessage(
                                                  _singleChatcontroller
                                                      .textEditingController
                                                      .text,
                                                  _singleChatcontroller
                                                      .currentChat!.id,
                                                  widget.chatModel.id);
                                              _singleChatcontroller
                                                  .textEditingController
                                                  .clear();
                                            },
                                            icon: const Icon(
                                              Icons.send,
                                              color: Colors.white,
                                            ),
                                          )
                                        : IconButton(
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
                                offstage: _singleChatcontroller
                                    .isEmojiPickerVisible.value,
                                child: SizedBox(
                                  height: 250,
                                  child: EmojiPicker(
                                      onEmojiSelected: (category, emoji) {
                                    _singleChatcontroller.textEditingController
                                        .text = _singleChatcontroller
                                            .textEditingController.text +
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
              if (!_singleChatcontroller.isEmojiPickerVisible.value) {
                _singleChatcontroller.isEmojiPickerVisible.value = true;
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
