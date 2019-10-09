import 'package:contacts/models/contact_model.dart';
import 'package:hasura_connect/hasura_connect.dart';

class HasuraService {
  static final String url = 'https://fluttercontacts.herokuapp.com/v1/graphql';
  final HasuraConnect hasuraConnect;

  HasuraService() : this.hasuraConnect = HasuraConnect(url);

  Future<ContactModel> saveContact(ContactModel contactModel) async {
    String query = """
  mutation {
  insert_contacts_list(objects: {email: "${contactModel.email}", name: "${contactModel.name}", mobile_number: "${contactModel.mobileNumber}", wa_number: "${contactModel.waNumber}"}) {
    returning {
      id
      email
      mobile_number
      name
      wa_number
    }
  }
}
    """;
    print(query);
    var result = await hasuraConnect.mutation(query);
    Map<String, dynamic> resultMap = Map.castFrom(result);
    if (resultMap.containsKey("data")) {
      Map<String, dynamic> dataList = Map.castFrom(resultMap["data"]);
      if (dataList.containsKey("insert_contacts_list")) {
        Map<String, dynamic> contactList =
            Map.castFrom(dataList["insert_contacts_list"]);
        if (contactList.containsKey("returning")) {
          List<Map<String, dynamic>> finalList =
              List.castFrom(contactList["returning"]);
          Map<String, dynamic> contactMap = finalList.elementAt(0);
          ContactModel contactModel = ContactModel.fromJson(contactMap);
          return contactModel;
        }
      }
    }
    return null;

    /*
      {
        "data": {
          "insert_contacts_list": {
            "returning": [
              {
                "id": 3,
                "email": "ajil@gmail.com",
                "mobile_number": "9882837283",
                "name": "Ajil",
                "wa_number": "73737373737"
              }
            ]
          }
        }
      }
    */
  }
}
