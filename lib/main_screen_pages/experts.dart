import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skismi/payment/subcription_ask.dart';
import 'package:skismi/webpages/chinesewebpage.dart';
import 'package:skismi/webpages/chingreadingwebpage.dart';
import 'package:skismi/webpages/crystalwebpage.dart';
import 'package:skismi/webpages/dreamwebpage.dart';
import 'package:skismi/webpages/magicwebpage.dart';
import 'package:skismi/webpages/oraclewebpage.dart';
import 'package:skismi/webpages/runnswebpage.dart';
import 'package:skismi/webpages/tarrotwebpage.dart';

class Experts extends StatefulWidget {
  const Experts({super.key});

  @override
  State<Experts> createState() => _ExpertsState();
}

class _ExpertsState extends State<Experts> {
  int count = 3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Skismi",
            style: GoogleFonts.roboto(fontWeight: FontWeight.bold)),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => SubsriptionAsk()));
              },
              icon: Icon(
                Icons.panorama_horizontal,
                color: Colors.white,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "Free Message This Week is $count To get Complete Features Please Purchase the Subscription",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 360,
                height: 120,
                decoration: BoxDecoration(
                  color: Color(0xff7A8194),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: ListTile(
                  onTap: () {
                    setState(() {
                      if (count > 0) {
                        count--;
                      } else
                        count = 0;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => TarrotWebPage()));
                  },
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/ww.png",
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
                        "For Tarot: Tarot is a form of divination in which our AI bot will draw cards from the 78 card tarot deck to gain insight and illumination about your situation",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 360,
                height: 120,
                decoration: BoxDecoration(
                  color: Color(0xff7A8194),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => ChineseWebPage()));
                  },
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/cjs.png",
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
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 360,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xff7A8194),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => OrcaleWebPage()));
                  },
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/oracle.png",
                        height: 54,
                      ),
                    ],
                  ),
                  title: Text(
                    "Oracle Consultations",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  subtitle: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Oracle: Consulting an Oracle deck is one of the best ways to do an Intuitive reading.",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 360,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xff7A8194),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => CrystalWebPage()));
                  },
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/women.png",
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
                        "Crystal ball: As our AI bot gazes into the crystal ball it describes the ups, downs and adventures it sees in your future.",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 360,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xff7A8194),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => DreamWebPage()));
                  },
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/clouds.png",
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
                        "Dream Interpretations: Our AI bot will discuss the patterns, themes and symbols in your dreams and their meanings for your waking life.",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 360,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xff7A8194),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => ChingReadingWebPage()));
                  },
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/hs.png",
                        height: 54,
                      ),
                    ],
                  ),
                  title: Text(
                    "I Ching Readings",
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
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 360,
                height: 120,
                decoration: BoxDecoration(
                  color: Color(0xff7A8194),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => RunesWebPage()));
                  },
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/gold.png",
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
                        "Runes readings: Our AI-generated runes readings app unlocks the mysteries of the ancient world, providing personalized insights into your future through the interpretation of runic symbols.",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 360,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xff7A8194),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => MagicWebPage()));
                  },
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/blackball.png",
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
                        "The Magic Eight-Ball can answer your deepest questions.",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
