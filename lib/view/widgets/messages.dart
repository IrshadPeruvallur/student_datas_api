import 'package:flutter/material.dart';

shwoSuccussSnackbar(context, content) {
  final snackbar = SnackBar(
    backgroundColor: Colors.black,
    content: Text(
      content,
      style: TextStyle(color: Colors.white),
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}

shwoErrorSnackbar(context, content) {
  final snackbar = SnackBar(
      backgroundColor: Color.fromARGB(255, 177, 0, 0),
      content: Text(
        content,
        style: TextStyle(color: Colors.white),
      ));
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}
