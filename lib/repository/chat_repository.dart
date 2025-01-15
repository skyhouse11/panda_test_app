import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_app/api/websocket_api.dart';
import 'package:test_app/repository/login_repository.dart';
import 'package:web_socket/web_socket.dart';

part 'chat_repository.g.dart';

@Riverpod(keepAlive: true)
class ChatRepository extends _$ChatRepository {
  late final WebSocket socket;

  late final loginRepoNotifier = ref.watch(loginRepositoryProvider.notifier);

  @override
  List<String> build() {
    ref.onDispose(
      () {
        closeSocket();
      },
    );

    return [];
  }

  Future<void> connectSocket() async {
    final url = 'ws://localhost:3001/chat';

    socket = await ref.read(connectSocketProvider(url).future);

    socketListen();
  }

  void socketListen() {
    socket.events.listen(
      (e) async {
        switch (e) {
          case TextDataReceived(text: final text):
            final String data = jsonDecode(text)['data'];

            if (data.isEmpty) {
              return;
            }

            state = [jsonDecode(text)['data'], ...state];

            break;
          case BinaryDataReceived(data: final _):
            break;
          case CloseReceived(code: final _, reason: final _):
            break;
        }
      },
    );
  }

  String createMessage(String message) {
    final user = loginRepoNotifier.userModel.user;

    return '$user: $message';
  }

  void sendMessage(String message) {
    socket.sendText(createMessage(message));
  }

  void closeSocket() {
    socket.close();
  }
}
