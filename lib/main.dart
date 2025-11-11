import 'package:flutter/material.dart';
import 'package:messenger_app/views/authentication/forgot_password.dart';
import 'package:messenger_app/views/authentication/login.dart';
import 'package:messenger_app/views/authentication/phone_authentication.dart';
import 'package:messenger_app/views/authentication/register.dart';
import 'package:messenger_app/views/authentication/verification_screen.dart';
import 'package:messenger_app/views/screens/audio_call_screen.dart';
import 'package:messenger_app/views/screens/call_history_screen.dart';
import 'package:messenger_app/views/screens/chatScreen.dart';
import 'package:messenger_app/views/screens/chat_list_screen.dart';
import 'package:messenger_app/views/screens/contact_list_screens.dart';
import 'package:messenger_app/views/screens/incoming_call_screen.dart';
import 'package:messenger_app/views/screens/splash_screen.dart';
import 'package:messenger_app/views/screens/video_call_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Messenger App - Authentication',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: ColorScheme.light(
          primary: const Color(0xFF14b8a6), // Deep Teal
          background: const Color(0xFFf6f6f8), // background-light
          surface: Colors.white,
          onBackground: const Color(0xFF0a1014), // background-dark
        ),
        fontFamily: 'Spline Sans',
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(
          primary: const Color(0xFF14b8a6), // Deep Teal
          background: const Color(0xFF0a1014), // background-dark
          surface: const Color(0xFF1a1f24),
          onBackground: Colors.white,
        ),
        fontFamily: 'Spline Sans',
      ),
      home:  ConnectScreen(),
    );
  }
}
