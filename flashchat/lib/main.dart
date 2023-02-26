import 'package:flutter/material.dart';
import 'screens/chat_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';

void main() => runApp(FlashChat());

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


// initialRoute: '/',
//       routes: {
//         '/': (context) => WelcomeScreen(),
//         '/chat': (context) => ChatScreen(),
//         '/register': (context) => RegistrationScreen(),
//         '/login': (context) => LoginScreen()
//       },