import 'dart:convert';

import 'package:chat_app/models/contact_model.dart';
import 'package:chat_app/pages/add_contact_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final List<ContactModel> _contacts = [];

  Future<void> _fetchContactsFromLocalStorage() async {
    final preferences = await SharedPreferences.getInstance();
    final contactsJson = preferences.getString('contacts');
    if (contactsJson != null) {
      Map<String, dynamic> contactsMap = jsonDecode(contactsJson);
      for (String contactJson in contactsMap['contacts']) {
        final ContactModel contactModel = ContactModel.fromJson(contactJson);
        _contacts.add(contactModel);
      }
    }
  }

  Future<void> _saveContactsIntoLocalStorage() async {
    final contactsMap = {
      'contacts': _contacts.map((contact) => contact.toJson()).toList(),
    };
    debugPrint(contactsMap.toString());

    final preferences = await SharedPreferences.getInstance();
    await preferences.setString('contacts', jsonEncode(contactsMap));
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _fetchContactsFromLocalStorage().then((_) {
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Contatos'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ListTile(
          //   leading: const Icon(Icons.person_add),
          //   title: const Text('Adicionar contato'),
          //   onTap: () {
          //     Navigator.of(context)
          //         .push<ContactModel>(
          //       MaterialPageRoute(
          //         builder: (context) => const AddContactPage(),
          //       ),
          //     )
          //         .then((newContact) {
          //       if (newContact != null) {
          //         setState(() {
          //           _contacts.add(newContact);
          //         });
          //         _saveContactsIntoLocalStorage();
          //       }
          //     });
          //   },
          // ),
          ..._contacts.map(
            (contact) => ListTile(
              title: Text(contact.name),
              onTap: () {},
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Adicionar contato',
        onPressed: () {
          Navigator.of(context)
              .push<ContactModel>(
            MaterialPageRoute(
              builder: (context) => const AddContactPage(),
            ),
          )
              .then((newContact) {
            if (newContact != null) {
              setState(() {
                _contacts.add(newContact);
              });
              _saveContactsIntoLocalStorage();
            }
          });
        },
        child: const Icon(Icons.person_add),
      ),
    );
  }
}
