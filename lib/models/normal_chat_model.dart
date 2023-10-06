import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/models/contact_model.dart';

class NormalChatModel {
  final ContactModel sender;
  final ContactModel receiver;
  final List<MessageModel> messages;

  NormalChatModel({required this.sender, required this.receiver, required this.messages});
}
