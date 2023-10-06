// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chat_app/models/contact_model.dart';
import 'package:chat_app/models/message_model.dart';

class ChatModel {
  final ContactModel contactModel;
  final List<MessageModel> messages;

  const ChatModel({required this.contactModel, this.messages = const []});

  ChatModel copyWith({
    ContactModel? contactModel,
    List<MessageModel>? messages,
  }) {
    return ChatModel(
      contactModel: contactModel ?? this.contactModel,
      messages: messages ?? this.messages,
    );
  }
}
