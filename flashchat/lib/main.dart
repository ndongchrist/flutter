import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/chat_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';

Future<void> main() async {
  await Firebase.initializeApp();
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: WelcomeScreen.welcome,
      routes: {
        WelcomeScreen.welcome: (context) => WelcomeScreen(),
        ChatScreen.chat: (context) => ChatScreen(),
        RegistrationScreen.registration: (context) => RegistrationScreen(),
        LoginScreen.login: (context) => LoginScreen()
      },
    );
  }
}
