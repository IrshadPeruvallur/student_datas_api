import 'package:flutter/material.dart';

class TodoPage extends StatelessWidget {
  final name;
  final age;
  final phone;
  const TodoPage({super.key, this.name, this.age, this.phone});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("name"), Text('zzzzzz')],
            ),
          ),
          Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("age"), Text('zzzzzz')],
            ),
          ),
          Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Phone"), Text('zzzzzz')],
            ),
          ),
        ],
      ),
    );
  }
}
