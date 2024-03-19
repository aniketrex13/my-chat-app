import 'package:get/get.dart';
import 'package:my_chat/store/chat_store.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

final controller = Get.put(ChatController());

mySocketConnection() {
  // Dart client

  IO.Socket socket = IO.io('http://localhost:3000');
  socket.onConnect((_) {
    print('connect');
    socket.emit('msg', 'test');
  });
  socket.on('recive', (data) => controller.getMessage(data));
  socket.onDisconnect((_) => print('disconnect'));
}
