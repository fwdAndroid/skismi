import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:skismi/main_screen_pages/chatpage.dart';
import 'package:skismi/main_screen_pages/experts.dart';
import 'package:skismi/main_screen_pages/settings.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Image.asset(
              "assets/text.png",
              height: 50,
            ),
            Spacer(),
            Image.asset(
              "assets/robot.png",
              height: 350,
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (builder) => Experts()));
                    },
                    child: Image.asset(
                      "assets/person.png",
                      height: 100,
                      width: 100,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (builder) => MyChat()));
                    },
                    child: Image.asset(
                      "assets/chat.png",
                      height: 100,
                      width: 100,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (builder) => Settings()));
                    },
                    child: Image.asset(
                      "assets/setting.png",
                      height: 100,
                      width: 100,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
