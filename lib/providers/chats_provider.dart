import 'package:chat_app/models/chat_model.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:flutter/material.dart';

import '../models/contact_model.dart';

class ChatsProvider extends ChangeNotifier {
  final List<ChatModel> _chats = [];

  List<ChatModel> get chats => _chats;

  void startChat({required ContactModel contact}) {
    List<ChatModel> existingChatsWithThisContact = _chats.where((element) => element.contactModel.name == contact.name).toList();
    if (existingChatsWithThisContact.isEmpty) {
      _chats.add(ChatModel(contactModel: contact));
      notifyListeners();
    }
  }

  void sendMessage({required int chatIndex, required MessageModel message}) {
    List<MessageModel> messagesUpdated = List.from(_chats[chatIndex].messages);
    messagesUpdated.add(message);

    _chats[chatIndex] = _chats[chatIndex].copyWith(
      messages: messagesUpdated,
    );

    notifyListeners();
  }
}
