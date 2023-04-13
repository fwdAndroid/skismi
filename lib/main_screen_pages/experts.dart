import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class Experts extends StatefulWidget {
  const Experts({super.key});

  @override
  State<Experts> createState() => _ExpertsState();
}

class _ExpertsState extends State<Experts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Skismi",
            style: GoogleFonts.roboto(fontWeight: FontWeight.bold)),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 360,
              height: 120,
              decoration: BoxDecoration(
                color: Color(0xff7A8194),
                borderRadius: BorderRadius.circular(40),
              ),
              child: ListTile(
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/t.png",
                      height: 54,
                    ),
                  ],
                ),
                title: Text(
                  "Tarot Card Reading",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                subtitle: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "tarot is used as a form of cartomancy in which practitioners draws cards to  gain insight around a situation",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: 360,
              height: 120,
              decoration: BoxDecoration(
                color: Color(0xff7A8194),
                borderRadius: BorderRadius.circular(40),
              ),
              child: ListTile(
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/chineses.png",
                      height: 54,
                    ),
                  ],
                ),
                title: Text(
                  "Chinese Horoscopes",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                subtitle: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "The Chinese zodiac is a traditional classification scheme based on the Chinese calendar that assigns an animal and its reputed attributes to each year in a repeating twelve-year cycle",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: 360,
              height: 120,
              decoration: BoxDecoration(
                color: Color(0xff7A8194),
                borderRadius: BorderRadius.circular(40),
              ),
              child: ListTile(
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/ass.png",
                      height: 54,
                    ),
                  ],
                ),
                title: Text(
                  "Oracle consultations",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                subtitle: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "I believe that consulting an oracle deck is one of the best ways to do an intuitive reading",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: 360,
              height: 120,
              decoration: BoxDecoration(
                color: Color(0xff7A8194),
                borderRadius: BorderRadius.circular(40),
              ),
              child: ListTile(
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/crystal.png",
                      height: 54,
                    ),
                  ],
                ),
                title: Text(
                  "Crystal Ball Reading",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                subtitle: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "The crystal ball, the clairvoyant will tell you your destiny. Do you feel the urge or need to know what is happening to you?",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: 360,
              height: 120,
              decoration: BoxDecoration(
                color: Color(0xff7A8194),
                borderRadius: BorderRadius.circular(40),
              ),
              child: ListTile(
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/dream.png",
                      height: 54,
                    ),
                  ],
                ),
                title: Text(
                  "Dream Interpretations",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                subtitle: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Nine common dream interpretations, what some of these common dream themes mean, and how to analyze your own dreams.",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: 360,
              height: 120,
              decoration: BoxDecoration(
                color: Color(0xff7A8194),
                borderRadius: BorderRadius.circular(40),
              ),
              child: ListTile(
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/ink.png",
                      height: 54,
                    ),
                  ],
                ),
                title: Text(
                  "I Ching readings",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                subtitle: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "I Ching (Yijing) oracle is based on the 64 principles from the Book of Changes with interpretations inspired by the elements of nature.",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: 360,
              height: 120,
              decoration: BoxDecoration(
                color: Color(0xff7A8194),
                borderRadius: BorderRadius.circular(40),
              ),
              child: ListTile(
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/download__1_-removebg-preview.png",
                      height: 54,
                    ),
                  ],
                ),
                title: Text(
                  "Runes readings",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                subtitle: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Online rune reading and experience an ancient form of divination and fortune-telling.",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: 360,
              height: 120,
              decoration: BoxDecoration(
                color: Color(0xff7A8194),
                borderRadius: BorderRadius.circular(40),
              ),
              child: ListTile(
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/bakk.png",
                      height: 54,
                    ),
                  ],
                ),
                title: Text(
                  "Magic Eight Ball",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                subtitle: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Five blank cards and one 8-Ball card are shown on both sides. Then spectator is then asked to choose one of the face down cards",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
