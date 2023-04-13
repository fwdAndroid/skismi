import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:url_launcher/url_launcher.dart';

class ChingReadingWebPage extends StatefulWidget {
  const ChingReadingWebPage({super.key});

  @override
  State<ChingReadingWebPage> createState() => _ChingReadingWebPageState();
}

class _ChingReadingWebPageState extends State<ChingReadingWebPage> {
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
            child: Text("Open Ching Reading"),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: _launchURL,
            child: Text("Chat with Ching Reading Expert"),
          )
        ],
      ),
    );
  }

  _launchURL() async {
    final Uri _url = Uri.parse('https://skismi.com/i-ching-results/');
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
