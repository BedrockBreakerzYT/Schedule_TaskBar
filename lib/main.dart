import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    body: const UsersList(),
    appBar: AppBar(title: const Text("Schedule For Today")),
  )));
}

// ignore: camel_case_types
class addListItems extends StatefulWidget {
  const addListItems(String text, {super.key});

  @override
  State<addListItems> createState() => _addListItemsState();
}

// ignore: camel_case_types
class _addListItemsState extends State<addListItems> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class UsersList extends StatefulWidget {
  const UsersList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UsersListState createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  final myController = TextEditingController();
  final List<String> _users = [];
  int _selectedIndex = -1;

  void addStaff() {}

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      TextFormField(
        controller: myController,
        decoration: const InputDecoration(border: OutlineInputBorder()),
      ),
      Text(
          _selectedIndex == -1
              ? "Not Selected"
              : "Selected: ${_users[_selectedIndex]}",
          style: const TextStyle(fontSize: 30)),
      ListView.builder(
        shrinkWrap: true,
        itemCount: _users.length,
        itemBuilder: (BuildContext context, int index) => ListTile(
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
          },
          title: Text(_users[index], style: const TextStyle(fontSize: 24)),
          selected: index == _selectedIndex,
          selectedTileColor: Colors.red,
        ),
      ),
      const Spacer(),
      GestureDetector(
          onTap: () {
            setState(() {
              _users.add(myController.text);
            });
          },
          child: Container(
            width: 50,
            height: 50,
            color: Colors.black,
          ))
    ]);
  }
}
