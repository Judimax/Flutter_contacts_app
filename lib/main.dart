import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyList();
  }
}

class MyList extends StatelessWidget {
  const MyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'List View Layout',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ListView(
          children: showContacts(),
        ));
  }

  List<Widget> createSquares(int numSquares) {
    int i = 0;
    List colors = [
      Colors.amber,
      Colors.deepPurple,
      Colors.orange,
      Colors.indigo,
      Colors.lightBlue
    ];

    List<Widget> squares = [];
    while (i < numSquares) {
      squares.add(
        Positioned(
          top: 100 + i.toDouble() * 100,
          left: 25 + i.toDouble() * 25,
          child: Container(
            color: colors[i % 5],
            // width: 100,
            // height: 100,
            child: Text(i.toString()),
          ),
        ),
      );
      i++;
    }
    return squares;
  }

  Widget createSeparator(int i) {
    return Container(
      height: 1,
      width: 10,
      color: Colors.black,
      margin: const EdgeInsets.only(top: 10),
    );
  }

  Widget createSquare(int position) {
    int i = 0;
    List colors = [
      Colors.amber,
      Colors.deepPurple,
      Colors.orange,
      Colors.indigo,
      Colors.lightBlue
    ];

    return Positioned(
      top: 100 + i.toDouble() * 100,
      left: 25 + i.toDouble() * 25,
      child: Container(
        color: colors[position % 5],
        width: 100,
        // height: 100,
        child: Text(position.toString()),
      ),
    );
  }

  List<SizedBox> showContacts() {
    List<Contact> contacts = buildContacts();
    List<SizedBox> tiles = [];

    for (int i = 0; i < 5; i++) {
      contacts.addAll(buildContacts());
    }

    for (var contact in contacts) {
      tiles.add(SizedBox(
          width: 20,
          height: 100,
          child: Scaffold(
            body: ListTile(
                title: Text(contact.name),
                subtitle: Text(contact.subtitle),
                leading: CircleAvatar(
                  child: Icon(contact.icon),
                  backgroundColor: Colors.amber[600],
                ),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                onTap: () => true),
          )));
    }
    return tiles;
  }

  List<Contact> buildContacts() {
    List<Contact> contacts = [];
    contacts.add(
        Contact("Lebron James", "Space Jam", Icons.sentiment_dissatisfied));
    contacts.add(
        Contact("Kobe Bryant", "Lower Merion", Icons.sentiment_dissatisfied));
    contacts.add(
        Contact("Michael Jordan", "Investments", Icons.sentiment_dissatisfied));
    return contacts;
  }
}

class Contact {
  String name;
  String subtitle;
  IconData icon;
  Contact(this.name, this.subtitle, this.icon);
}
