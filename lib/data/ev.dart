import 'package:flutter/material.dart';

Color backgroundColor=  const Color(0xff3E4768);
Color elevatedButtonColor = const Color(0xff1569C7);
Color cardColor = const Color(0xffEBF4FA);

// TextFieldForm decoration
const inputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.green, width: 2),
  )
);
