import 'package:chat_app/models/contact_model.dart';

class MessageModel {
  final ContactModel user;
  final String text;
  final bool read;
  final DateTime dateTime;

  MessageModel({required this.user, required this.text, this.read = false, required this.dateTime});
}
