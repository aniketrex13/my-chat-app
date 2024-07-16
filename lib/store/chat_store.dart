import 'package:get/get.dart';

class ChatController extends GetxController {
  List<dynamic> messageList = ["hello", "hii"].obs;

  getMessage(message) {
    messageList.add(message);
  }
}
