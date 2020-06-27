class Contact {
  String id;
  String name;
  String email;
  String phone;
  String image;

//  Contact({this.id, this.name, this.email, this.phone, this.image})

  Contact(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    phone = json["phone"];
    image = json["image"];
  }
}

class ContactList {
  List<Contact> contacts = [];

  ContactList(Map<String, dynamic> json) {
    contacts = json["contacts"].map<Contact>((map) => Contact(map)).toList();
  }
}
