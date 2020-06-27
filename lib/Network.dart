import 'dart:convert';

import 'package:contacts/model/Contact.dart';
import 'package:http/http.dart' as http;

class Network {
  Future<ContactList> getContacts() async {
    final response = await http.get(
        "https://gist.githubusercontent.com/anacoimbrag/50cb96b6c57100c1881be36d98bc4d2a/raw/1c2176ffaafc54baeb82f62d81e7a3fa4615244a/contactData.json");
    if (response.statusCode == 200) {
      return ContactList(json.decode(response.body));
    } else
      throw Exception("Could not load contacts");
  }
}
