import 'package:get/get.dart';

class ChatController extends GetxController {
  List<dynamic> messageList = ["hello", "hii"];

  getMessage(message) {
    messageList.add(message);
  }
}
