import 'package:contacts/Network.dart';
import 'package:contacts/model/Contact.dart';
import 'package:contacts/view/Contact.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactListWidget extends StatefulWidget {
  ContactListWidget({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactListWidget> {
  Future<ContactList> futureContacts;

  @override
  void initState() {
    super.initState();
    futureContacts = Network().getContacts();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: FutureBuilder<ContactList>(
          future: futureContacts,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: snapshot.data.contacts
                    .map((contact) => ContactItem(contact))
                    .toList(),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            return CircularProgressIndicator();
          },
        ));
  }
}
