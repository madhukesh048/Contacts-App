import 'dart:convert';

ContactModel contactModelFromJson(String str) => ContactModel.fromJson(json.decode(str));

String contactModelToJson(ContactModel data) => json.encode(data.toJson());

class ContactModel {
    String name;
    int id;
    String mobileNumber;
    String waNumber;
    String address;
    String email;

    ContactModel({
        this.name,
        this.id,
        this.address,
        this.email,
        this.mobileNumber,
        this.waNumber
    });

    factory ContactModel.fromJson(Map<String, dynamic> json) => new ContactModel(
        name: json["name"],
        id: json["id"],
        address: json["address"],
        email: json["email"],
        mobileNumber: json["mobile_number"],
        waNumber: json["wa_number"]
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "address": address,
        "email": email,
        "mobile_number": mobileNumber,
        "wa_number": waNumber
    };
}