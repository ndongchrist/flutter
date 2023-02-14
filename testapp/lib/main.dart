import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("EchoVision"),
        ),
        body: Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("images/Brain1.jpg"),
              maxRadius: 50,
            ),
            Text(
              "Ndongmo Christian",
              style: TextStyle(
                fontWeight: FontWeight.w300,
              ),
            ),
            Container(
              color: Colors.black,
              width: 500,
              height: 2,
            ),
            Text(
              "Flutter Developer",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 50,
            ),
            Card(
                color: Colors.white,
                child: Row(
                  children: [
                    Icon(Icons.mail),
                    Text("     christianhono2003@gmail.com")
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            Card(
                color: Colors.white,
                child: Row(
                  children: [
                    Icon(Icons.mail),
                    Text("     christianhono2003@gmail.com")
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            Card(
                elevation: 20.5,
                color: Colors.white,
                child: Row(
                  children: [
                    Icon(Icons.mail),
                    Text("     christianhono2003@gmail.com")
                  ],
                ))
          ],
          mainAxisAlignment: MainAxisAlignment.center,

          // crossAxisAlignment: CrossAxisAlignment.center,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.hdr_plus),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Container(height: 35.0),
          color: Color.fromARGB(255, 134, 12, 190),
        ),
        backgroundColor: Color.fromARGB(115, 14, 164, 184),
      ),
    );
  }
}
