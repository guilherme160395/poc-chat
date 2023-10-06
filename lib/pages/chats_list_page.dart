import 'package:chat_app/models/chat_model.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/contacts_page.dart';
import 'package:chat_app/providers/chats_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatsListPage extends StatefulWidget {
  const ChatsListPage({super.key});

  @override
  State<ChatsListPage> createState() => _ChatsListPageState();
}

class _ChatsListPageState extends State<ChatsListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Conversas'),
      ),
      body: Consumer<ChatsProvider>(
        builder: (context, value, child) {
          Widget body = Container();

          if (value.chats.isEmpty) {
            body = const Center(
              child: Text('Nenhuma conversa'),
            );
          } else {
            body = ListView.builder(
              itemCount: value.chats.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(value.chats[index].contactModel.name),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ChatPage(
                          index: index,
                        ),
                      ),
                    );
                  },
                );
              },
            );
          }

          return body;
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Iniciar conversa',
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ContactsPage(),
            ),
          );
        },
        child: const Icon(Icons.chat),
      ),
    );
  }
}
