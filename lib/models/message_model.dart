// ignore_for_file: public_member_api_docs, sort_constructors_first
class MessageModel {
  final String text;
  final DateTime dateTime;

  final bool sent;
  final bool delivered;
  final bool seen;

  final bool isSender;

  MessageModel({
    required this.text,
    required this.dateTime,
    this.sent = false,
    this.delivered = false,
    this.seen = false,
    this.isSender = true,
  });

  MessageModel copyWith({
    String? text,
    DateTime? dateTime,
    bool? sent,
    bool? delivered,
    bool? seen,
    bool? isSender,
  }) {
    return MessageModel(
      text: text ?? this.text,
      dateTime: dateTime ?? this.dateTime,
      sent: sent ?? this.sent,
      delivered: delivered ?? this.delivered,
      seen: seen ?? this.seen,
      isSender: isSender ?? this.isSender,
    );
  }
}
