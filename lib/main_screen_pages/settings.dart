import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skismi/auth/login_screen.dart';
import 'package:skismi/payment/subcription_ask.dart';
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
          SwitchListTile(
            title: Text(
              "Sound",
              style: TextStyle(color: Colors.white),
            ),
            value: true,
            onChanged: (bool? value) {},
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
              "Terms of Services",
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => SubsriptionAsk()));
            },
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
    final Uri _url = Uri.parse('https://skismi.com/privacy-policy/');
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  void _launchTerms() async {
    final Uri _url = Uri.parse('https://skismi.com/terms/');
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
