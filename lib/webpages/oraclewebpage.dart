import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:url_launcher/url_launcher.dart';

class OrcaleWebPage extends StatefulWidget {
  const OrcaleWebPage({super.key});

  @override
  State<OrcaleWebPage> createState() => _OrcaleWebPageState();
}

class _OrcaleWebPageState extends State<OrcaleWebPage> {
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
            child: Text("Open Oracle Consultations"),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: _launchURL,
            child: Text("Chat with Oracle Consultations Expert"),
          )
        ],
      ),
    );
  }

  _launchURL() async {
    final Uri _url = Uri.parse('https://skismi.com/oracle-test/');
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
