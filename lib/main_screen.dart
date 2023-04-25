import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:skismi/main_screen_pages/chatpage.dart';
import 'package:skismi/main_screen_pages/experts.dart';
import 'package:skismi/main_screen_pages/settings.dart';
import 'package:skismi/messages/chat_screen.dart';
import 'package:skismi/webpages/webpage.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<String> imgList = [
    'assets/blackball.png',
    'assets/gold.png',
    'assets/ww.png',
    'assets/women.png',
    'assets/hs.png',
    'assets/clouds.png',
    'assets/cjs.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 20),
              height: 50,
              child: Text(
                "Welcome to the Skismi app. Discover your destiny with Skismi's AI-generated divinations",
                style: TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
                child: GestureDetector(
              child: CarouselSlider(
                options: CarouselOptions(autoPlay: true),
                items: choices
                    .map((Choice) => Container(
                          height: MediaQuery.of(context).size.height,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (builder) => ChatScreen(
                                          name: Choice.content,
                                          uuid: Choice.content)));
                            },
                            child: Column(
                              children: [
                                Expanded(
                                  child: Image.asset(
                                    Choice.title,
                                    fit: BoxFit.fill,
                                    width: 250,
                                    height: 250,
                                  ),
                                ),
                                Text(
                                  Choice.content,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                )
                              ],
                            ),
                          ),
                        ))
                    .toList(),
              ),
            )),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Get Readings Now",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(), fixedSize: Size(200, 60)),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Rooms
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (builder) => Experts()));
                    },
                    child: Image.asset(
                      "assets/person.png",
                      height: 60,
                      width: 60,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  //Trail

                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => MyWidget(
                                    url:
                                        "https://skismi.com/tarot-card-results-trial/",
                                    title: "Trial Page",
                                  )));
                    },
                    child: Image.asset(
                      "assets/tt.png",
                      height: 60,
                      width: 60,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),

                  //Privacy
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (builder) => Settings()));
                    },
                    child: Image.asset(
                      "assets/setting.png",
                      height: 60,
                      width: 60,
                    ),
                  ),
                  //Chat
                  SizedBox(
                    width: 30,
                  ),

                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => MyWidget(
                                    url: "https://skismi.com/appvideos/",
                                    title: "Video Page",
                                  )));
                    },
                    child: Image.asset(
                      "assets/video.png",
                      height: 60,
                      width: 60,
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

//?Coursel Class
class Choice {
  const Choice({required this.title, required this.content});

  final String title;

  final String content;
}

const List<Choice> choices = const <Choice>[
  const Choice(
      title: 'assets/blackball.png',
      content: 'The Magic Eight-Ball has answers to your questions'),
  const Choice(
      title: 'assets/gold.png',
      content: 'Uncover the timeless wisdom of the Runes'),
  const Choice(
      title: 'assets/ww.png', content: 'Let the wisdom of the Tarot guide you'),
  const Choice(
      title: 'assets/women.png',
      content: 'Stare into the Crystal Ball with me'),
  const Choice(
      title: 'assets/hs.png', content: 'The I Ching has answers for you'),
  const Choice(
      title: 'assets/clouds.png',
      content: 'Discover the meaning of your dreams'),
  const Choice(
      title: 'assets/cjs.png',
      content: 'Find ancient wisdom with your Chinese Horoscope'),
];
