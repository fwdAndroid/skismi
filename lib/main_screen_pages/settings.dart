import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:skismi/auth/login_screen.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Image.asset(
            "assets/logo.png",
            height: 250,
          ),
          Divider(
            color: Colors.white,
          ),
          ListTile(
            onTap: _launchURL,
            title: Text(
              "Privacy Policy",
              style: TextStyle(color: Colors.white),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ),
          Divider(
            color: Colors.white,
          ),
          ListTile(
            onTap: _launchTerms,
            title: Text(
              "Terms of Service",
              style: TextStyle(color: Colors.white),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ),
          Divider(
            color: Colors.white,
          ),
          ListTile(
            onTap: _urlEmail,
            title: Text(
              "Member Support",
              style: TextStyle(color: Colors.white),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ),
          Divider(
            color: Colors.white,
          ),
          ListTile(
            onTap: () {
              Share.share('Check Out Skismi https://example.com',
                  subject: 'Look what I made!');
            },
            title: Text(
              "Share",
              style: TextStyle(color: Colors.white),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ),
          Divider(
            color: Colors.white,
          ),
          ListTile(
            onTap: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 200,
                    color: Colors.black,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Text(
                            'Are you sure you want to exist?',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                child: const Text('Yes'),
                                onPressed: () async {
                                  await FirebaseAuth.instance
                                      .signOut()
                                      .then((value) => {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (builder) =>
                                                        LoginScreen()))
                                          });
                                },
                              ),
                              TextButton(
                                child: const Text('No'),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            title: Text(
              "Logout",
              style: TextStyle(color: Colors.white),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ),
          Divider(
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  _launchURL() async {
    final Uri _url = Uri.parse('https://skismi.com/app-privacy/');
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  void _launchTerms() async {
    final Uri _url = Uri.parse('https://skismi.com/app-terms/');
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'support@skismi.com',
    queryParameters: {
      'subject': 'Hello Skismi',
      'body': 'I have an query',
    },
  );

  void _urlEmail() async {
    final mailtoLink = Mailto(
      to: ['support@skismi.com'],
      subject: 'Hello Skismi',
      body: 'I have an query',
    );
    // Convert the Mailto instance into a string.
    // Use either Dart's string interpolation
    // or the toString() method.
    await launch('$mailtoLink');
  }
}
