import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gpt/service/api_service.dart';
import 'package:gpt/view/message_screen.dart';

class ChatProvider extends ChangeNotifier {
  final List<ChatMessage> _messages = [];
  List<ChatMessage> get messages => _messages;

  final TextEditingController controller = TextEditingController();
  bool isLoading = false;

  Future<void> sendMessage() async {
    String text = controller.text;
    if (text.isEmpty) return;

    _messages.add(ChatMessage(text: text, isUser: true));
    controller.clear();
    notifyListeners();

    isLoading = true; // Set loading to true
    notifyListeners();

    try {
      String response = await GeminiAPI.getResponse(text);
      _messages.add(ChatMessage(text: response, isUser: false));
    } catch (e) {
      _messages.add(ChatMessage(text: "Error: $e", isUser: false));
    } finally {
      isLoading = false; // Reset loading
      notifyListeners();
    }
  }
}
