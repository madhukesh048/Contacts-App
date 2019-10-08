import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddContactsPage extends StatefulWidget {
  @override
  _AddContactsPageState createState() => _AddContactsPageState();
}

class _AddContactsPageState extends State<AddContactsPage> {
  var _formKey = GlobalKey<FormState>();
  String _name;
  String _phoneNumber;
  String _waNumber;
  String _email;
  String _address;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Contacts"),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FlatButton(
          color: Colors.blue,
          onPressed: () {
            _formKey.currentState.save();
            print("Name:$_name,PhoneNumber:$_phoneNumber,WANumber:$_waNumber,Email:$_email,Address:$_address");
          },
          child: Text(
            "Save",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                onSaved: (val) {
                  _name = val;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Name",
                  border: InputBorder.none,
                  hintText: 'Enter name',
                ),
              ),
              TextFormField(
                onSaved: (val) {
                  _phoneNumber = val;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Mobile Number",
                    border: InputBorder.none,
                    hintText: 'Enter Mobile Number'),
              ),
              TextFormField(
                onSaved: (val) {
                  _waNumber = val;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "WhatsApp Number",
                    border: InputBorder.none,
                    hintText: 'Enter WA number'),
              ),
              TextFormField(
                onSaved: (val) {
                  _email = val;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: "Email",
                    border: InputBorder.none,
                    hintText: 'Enter email'),
              ),
              TextFormField(
                onSaved: (val) {
                  _address = val;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: "Address",
                    border: InputBorder.none,
                    hintText: 'Enter address'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*
mutation {
  insert_contacts_list(objects: {email: "madhukesh04@gmail.com", name: "Madhukesh D", mobile_number: "7019062030", wa_number: "9686463332"}) {
    returning {
      id
      email
      mobile_number
      name
      wa_number
    }
  }
}
*/

/*
{
  "data": {
    "insert_contacts_list": {
      "returning": [
        {
          "id": 1,
          "email": "madhukesh04@gmail.com",
          "mobile_number": "7019062030",
          "name": "Madhukesh D",
          "wa_number": "9686463332"
        }
      ]
    }
  }
}
*/