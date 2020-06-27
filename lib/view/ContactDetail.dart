import 'package:contacts/model/Contact.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Contact contact = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(contact.name),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(contact.image),
                radius: 60,
              ),
              Text(contact.name, style: Theme.of(context).textTheme.title),
              Text(contact.email, style: Theme.of(context).textTheme.caption),
              Text(contact.phone, style: TextStyle(color: Colors.blue))
            ],
          ),
        ),
      ),
    );
  }
}
