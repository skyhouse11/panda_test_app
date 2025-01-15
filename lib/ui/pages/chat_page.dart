import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/repository/chat_repository.dart';

class ChatPage extends ConsumerStatefulWidget {
  const ChatPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  final textFieldKey = TextEditingController();

  void sendMessage(String message) {
    ref.read(chatRepositoryProvider.notifier).sendMessage(message);

    textFieldKey.clear();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(chatRepositoryProvider.notifier).connectSocket();
    });
  }

  @override
  Widget build(BuildContext context) {
    final chatData = ref.watch(chatRepositoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Page'),
        leading: SizedBox(),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              reverse: true,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(chatData[index]),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: chatData.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: textFieldKey,
              onSubmitted: sendMessage,
              decoration: InputDecoration(
                hintText: 'Type a message',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => sendMessage(textFieldKey.text),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
