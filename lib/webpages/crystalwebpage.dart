import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:url_launcher/url_launcher.dart';

class CrystalWebPage extends StatefulWidget {
  const CrystalWebPage({super.key});

  @override
  State<CrystalWebPage> createState() => _CrystalWebPageState();
}

class _CrystalWebPageState extends State<CrystalWebPage> {
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
            child: Text("Open Crystal Ball Reading"),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: _launchURL,
            child: Text("Chat with Crystal Ball Reading Expert"),
          )
        ],
      ),
    );
  }

  _launchURL() async {
    final Uri _url = Uri.parse('https://skismi.com/crystal-ball-reading/');
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
