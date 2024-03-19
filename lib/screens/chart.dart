import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_chat/components/chart_card.dart';
import 'package:my_chat/connection/client.dart';
import 'package:my_chat/store/chat_store.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class MyChat extends StatefulWidget {
  const MyChat({super.key});

  @override
  State<MyChat> createState() => _MyChatState();
}

class _MyChatState extends State<MyChat> {
  List<dynamic> messageList = [];
  final controller = Get.put(ChatController());

  late TextEditingController messageController = TextEditingController();
  IO.Socket socket = IO.io('http://localhost:3000');
  @override
  void initState() {
    super.initState();
    mySocketConnection();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height / 1.2,
                child: ListView.builder(
                    itemCount: controller.messageList.length,
                    itemBuilder: (context, index) {
                      return Align(
                          alignment: Alignment.centerLeft,
                          child: ChartCard(controller.messageList[index]));
                    })),
            Material(
              color: Colors.black,
              child: Row(
                children: [
                  const SizedBox(
                    width: 8.0,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.3,
                    child: TextFormField(
                      controller: messageController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.black,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          hintText: "Enter Your message",
                          hintStyle: TextStyle(color: Colors.white)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      socket.emit('send', messageController.text);
                      controller.getMessage(messageController.text);
                      messageController.text = "";
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Icon(
                        Icons.send,
                        color: Colors.purple[400],
                        size: 36.0,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
