import 'package:flutter/material.dart';

class MyChat extends StatelessWidget {
  const MyChat({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Skismi'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: "Messages",
              ),
              Tab(
                text: "Experts",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Text(
                "No Chat Start",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Center(
              child: Text(
                "No Expert is Selected",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
