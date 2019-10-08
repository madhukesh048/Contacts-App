import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddContactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Contacts"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "Name",
                  border: InputBorder.none,
                  hintText: 'Enter name',
                  ),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Mobile Number",
                  border: InputBorder.none,
                  hintText: 'Enter Mobile Number'),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "WhatsApp Number",
                  border: InputBorder.none,
                  hintText: 'Enter WA number'),
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: "Email",
                  border: InputBorder.none,
                  hintText: 'Enter email'),
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "Address",
                  border: InputBorder.none,
                  hintText: 'Enter address'),
            ),
          ],
        ),
      ),
    );
  }
}
