import 'package:chat_app/models/normal_chat_model.dart';
import 'package:chat_app/pages/contacts_page.dart';
import 'package:flutter/material.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  List<NormalChatModel> chats = [];

  @override
  Widget build(BuildContext context) {
    Widget body = Container();

    if (chats.isEmpty) {
      body = const Center(
        child: Text('Nenhuma conversa'),
      );
    } else {
      body = ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          return const ListTile();
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Conversas'),
      ),
      body: body,
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
