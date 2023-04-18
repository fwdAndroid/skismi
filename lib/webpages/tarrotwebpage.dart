import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:skismi/main_screen_pages/chatpage.dart';
import 'package:skismi/messages/messageai.dart';
import 'package:skismi/webpages/webpage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';

class TarrotWebPage extends StatefulWidget {
  const TarrotWebPage({super.key});

  @override
  State<TarrotWebPage> createState() => _TarrotWebPageState();
}

class _TarrotWebPageState extends State<TarrotWebPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Image.asset("assets/logo.png"),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (builder) => MyWidget(
                            url: "https://skismi.com/tarot-card-results2/",
                            title: "Tarot Card",
                          )));
            },
            child: Text("Open Tarot Card"),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              var uuid = Uuid().v4();
              FirebaseFirestore.instance
                  .collection("cardsreading")
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .collection("messageslist")
                  .doc(uuid)
                  .set({
                "name": "Tarot Card",
                "uuid": uuid,
                "uid": FirebaseAuth.instance.currentUser!.uid
              }).then((value) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => MessageAI()));
              });
            },
            child: Text("Chat with Tarot Expert"),
          )
        ],
      ),
    );
  }
}
