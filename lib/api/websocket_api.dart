import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_socket/web_socket.dart';

part 'websocket_api.g.dart';

@riverpod
Future<WebSocket> connectSocket(Ref ref, String url) async =>
    await WebSocket.connect(
      Uri.parse(url),
    ).onError<WebSocketException>(
      (error, stackTrace) {
        throw Exception(error.message);
      },
    );
