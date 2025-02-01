import 'package:flutter/material.dart';
import 'package:gpt/controller/chat_provider.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("AI Chat")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: chatProvider.messages.length + (chatProvider.isLoading ? 1 : 0),
              itemBuilder: (ctx, index) {
                if (index == chatProvider.messages.length && chatProvider.isLoading) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/123.gif', // Path to the GIF
                          width: 90, // Adjust the size as needed
                          height: 90,
                        ),
                      ],
                    ),
                  );
                }

                return chatProvider.messages[index];
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: chatProvider.controller,
                    decoration: const InputDecoration(hintText: "Type message..."),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () => chatProvider.sendMessage(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
