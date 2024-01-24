import 'package:flutter/material.dart';

textFormField(controller, label) {
  return TextField(
    controller: controller,
    decoration:
        InputDecoration(label: Text(label), border: OutlineInputBorder()),
  );
}
