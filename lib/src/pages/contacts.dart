import 'package:flutter/material.dart';

enum Segments { my, add }

List<String> contacts = [
  'Contact1',
  'Contact2',
  'Contact3',
  'Contact4',
  'Contact5',
  'Contact6',
  'Contact7',
  'Contact8',
  'Contact9',
  'Contact10',
  'Contact11',
  'Contact12'
];

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  Segments selected = Segments.my;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Color.fromRGBO(150, 150, 150, 0.2),
              ),
              child: TextField(
                decoration:
                    InputDecoration(hintText: 'Search', border: InputBorder.none, prefixIcon: Icon(Icons.search)),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          SegmentedButton(
              segments: [
                ButtonSegment(value: Segments.my, label: Text('My contacts')),
                ButtonSegment(value: Segments.add, label: Text('Add new contacts'))
              ],
              selected: {
                selected
              },
              showSelectedIcon: false,
              onSelectionChanged: (Set<Segments> selection) {
                setState(() {
                  selected = selection.first;
                });
              },
              style: ButtonStyle(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity(horizontal: -2, vertical: -2),
              )),
          SizedBox(
            height: 15,
          ),
          selected == Segments.my
              ? Column(
                  children: contacts
                      .map((contact) => ListTile(
                            title: Text(contact),
                          ))
                      .toList())
              : Text('Add new contacts')
        ],
      ),
    );
  }
}
