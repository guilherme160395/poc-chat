import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/providers/chats_provider.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  final int index;

  const ChatPage({super.key, required this.index});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    final provider = context.read<ChatsProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(provider.chats[widget.index].contactModel.name),
      ),
      body: SizedBox.expand(
        child: Column(
          children: [
            Expanded(
              child: Consumer<ChatsProvider>(
                builder: (context, value, child) {
                  Widget myWidget = Container();

                  List<Widget> chatBubbles = [];
                  if (value.chats.isNotEmpty) {
                    String lastDate = '';
                    for (var message in value.chats[widget.index].messages) {
                      debugPrint('message $message');
                      debugPrint('message dateTime ${message.dateTime}');
                      if (DateFormat('dd/MM/yyyy').format(message.dateTime) != lastDate) {
                        chatBubbles.add(
                          DateChip(
                            date: message.dateTime,
                            color: const Color(0x558AD3D5),
                          ),
                        );
                        lastDate = DateFormat('dd/MM/yyyy').format(message.dateTime);
                      }
                      chatBubbles.add(
                        BubbleSpecialThree(
                          text: message.text,
                          sent: message.sent,
                          delivered: message.delivered,
                          seen: message.seen,
                          isSender: message.isSender,
                          color: const Color(0xFF1B97F3),
                          tail: true,
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      );
                    }
                    myWidget = Column(
                      children: chatBubbles,
                    );
                  }

                  return myWidget;
                },
              ),
            ),
            MessageBar(
              messageBarHitText: 'Mensagem',
              onSend: (value) {
                provider.sendMessage(
                  chatIndex: widget.index,
                  message: MessageModel(
                    text: value,
                    dateTime: DateTime.now(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
