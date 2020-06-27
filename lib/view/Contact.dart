import 'package:contacts/model/Contact.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ContactItem extends StatelessWidget {
  Contact contact;

  ContactItem(this.contact, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/detail', arguments: contact);
        },
        child: Container(
          padding: EdgeInsets.all(16),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(contact.image),
                  radius: 20,
                ),
              ),
              Text(contact.name, style: Theme
                  .of(context)
                  .textTheme
                  .headline)
            ],
          ),
        )
    );
  }
}
