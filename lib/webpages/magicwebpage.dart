import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:skismi/messages/messageai.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';

class MagicWebPage extends StatefulWidget {
  const MagicWebPage({super.key});

  @override
  State<MagicWebPage> createState() => _MagicWebPageState();
}

class _MagicWebPageState extends State<MagicWebPage> {
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
            onPressed: _launchURL,
            child: Text("Open Magic Eight Ball"),
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
                "name": "Magic Eight Ball",
                "uuid": uuid,
                "uid": FirebaseAuth.instance.currentUser!.uid
              }).then((value) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => MessageAI()));
              });
            },
            child: Text("Chat with Magic Eight Ball Expert"),
          )
        ],
      ),
    );
  }

  _launchURL() async {
    final Uri _url = Uri.parse('https://skismi.com/magic-eight-ball-results/');
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
