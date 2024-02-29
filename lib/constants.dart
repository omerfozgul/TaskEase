import 'package:flutter/material.dart';

ButtonStyle kAddButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.amberAccent),
    foregroundColor: MaterialStateProperty.all(Colors.purple));

InputDecoration kTaskTextboxDecoration = InputDecoration(
  labelText: 'New Task',
  border: OutlineInputBorder(),
);
