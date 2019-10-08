import 'package:contacts/ui/views/add_contacts.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddContactsPage()));
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      // body: ListView.builder(
      //   itemCount: 3,
      // ),
    );
  }
}
