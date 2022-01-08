import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:voice_auth_app/data/ev.dart';
import 'package:voice_auth_app/views/auth/register.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: backgroundColor,
    )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RegisrationView(),
    );
  }
}