import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:url_launcher/url_launcher.dart';

class RunesWebPage extends StatefulWidget {
  const RunesWebPage({super.key});

  @override
  State<RunesWebPage> createState() => _RunesWebPageState();
}

class _RunesWebPageState extends State<RunesWebPage> {
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
            child: Text("Open Runes Reading"),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: _launchURL,
            child: Text("Chat with Runes Reading Expert"),
          )
        ],
      ),
    );
  }

  _launchURL() async {
    final Uri _url = Uri.parse('https://skismi.com/runes-results/');
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
