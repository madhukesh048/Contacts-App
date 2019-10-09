import 'dart:io';
import 'package:contacts/models/contact_model.dart';
import 'package:contacts/services/hasura_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class AddContactsPage extends StatefulWidget {
  @override
  _AddContactsPageState createState() => _AddContactsPageState();
}

class _AddContactsPageState extends State<AddContactsPage> {
  var _formKey = GlobalKey<FormState>();
  ContactModel contactModel;

  @override
  void initState() {
    super.initState();
    contactModel = ContactModel();
  }

  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

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
            HasuraService().saveContact(contactModel);
            _formKey.currentState.save();
            print(
                "Name:${contactModel.name},PhoneNumber:${contactModel.mobileNumber},WANumber:${contactModel.waNumber},Email:${contactModel.email},Address:${contactModel.address}");
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
              Center(
                child: GestureDetector(
                  onTap: () {
                    getImage();
                  },
                  child: _image != null
                      ? Container(
                          width: 90.0,
                          height: 90.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                            image: DecorationImage(
                                image: FileImage(_image), fit: BoxFit.fill),
                          ),
                        )
                      : Container(
                          width: 90.0,
                          height: 90.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                          ),
                        ),
                ),
              ),
              TextFormField(
                onSaved: (val) {
                  contactModel.name = val;
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
                  contactModel.mobileNumber = val;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Mobile Number",
                    border: InputBorder.none,
                    hintText: 'Enter Mobile Number'),
              ),
              TextFormField(
                onSaved: (val) {
                  contactModel.waNumber = val;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "WhatsApp Number",
                    border: InputBorder.none,
                    hintText: 'Enter WA number'),
              ),
              TextFormField(
                onSaved: (val) {
                  contactModel.email = val;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: "Email",
                    border: InputBorder.none,
                    hintText: 'Enter email'),
              ),
              TextFormField(
                onSaved: (val) {
                  contactModel.address = val;
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
