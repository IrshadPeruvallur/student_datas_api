import 'package:flutter/material.dart';

elevatedButton(text, {VoidCallback? onPressed}) {
  return SizedBox(
    width: double.infinity,
    height: 50,
    child: ElevatedButton(
        onPressed: () {
          onPressed!();
        },
        child: Text(text)),
  );
}
