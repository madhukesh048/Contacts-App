import 'package:contacts/models/contact_model.dart';
import 'package:hasura_connect/hasura_connect.dart';


String url = 'https://fluttercontacts.herokuapp.com/v1/graphql';
HasuraConnect hasuraConnect = HasuraConnect(url);


Future<ContactModel> addContact()async{
String docMutation = """
mutation {
  insert_contacts_list(objects: {email: _email, name: _name, mobile_number: _phoneNumber, wa_number: _waNumber, address: _address}) {
    returning {
      id
      email
      mobile_number
      name
      wa_number
      address
    }
  }
}
""";

  // var data = await connection.mutation(query, variables: {"name": name});
  //   var id = data["data"]["insert_users"]["returning"][0]["id"];
  //   return UserModel(id: id, name: name);
var r = await hasuraConnect.query(docMutation);
print(r);
return ContactModel();
}



String docQuery = """
{
  contacts_list {
    name
    mobile_number
  }
}
""";
