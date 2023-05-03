import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skismi/main_screen.dart';
import 'package:intl/intl.dart';
import 'package:skismi/main_screen_pages/experts.dart';
import 'package:skismi/messages/chat_screen.dart';
import 'package:skismi/model/profile_model.dart';
import 'package:skismi/webpages/payment_web_page/monthly_web_page.dart';
import 'package:skismi/webpages/payment_web_page/yearly_web_page.dart';

class SubsriptionAsk extends StatefulWidget {
  SubsriptionAsk({super.key});

  @override
  State<SubsriptionAsk> createState() => _SubsriptionAskState();
}

class _SubsriptionAskState extends State<SubsriptionAsk> {
  TextEditingController controller = TextEditingController();
  Map<String, dynamic>? paymentIntent;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Skismi",
            style:
                GoogleFonts.roboto(fontSize: 40, fontWeight: FontWeight.bold)),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(right: 10),
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => MainScreen()));
                  },
                  icon: Icon(
                    Icons.cancel,
                    color: Colors.yellowAccent,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Image.asset("assets/ss.png"),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => MonthlyWebPage(
                                  title: "Weekly",
                                  url:
                                      "Weekly: https://checkout.stripe.com/c/pay/cs_live_b1u5Ov4moSYZT6GCvr21rXzCJGPSKeUpmTpNXUlHdXiaHjeUXcbP7EkNLV#fidkdWxOYHwnPyd1blppbHNgWmhrQEhXXWdpMTdETnVgckpJQHBHX0F%2FQScpJ3VpbGtuQH11anZgYUxhJz8nM2pAM3dNNnxgY2RwNlxmZkhIJyknd2BjYHd3YHdKd2xibGsnPydtcXF1Pyoqdm5sdmhsK2ZqaConeCUl ",
                                )));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xffFDDC5C),
                        borderRadius: BorderRadius.circular(25)),
                    width: 150,
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Weekly",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("\$ 7.99")
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                InkWell(
                  onTap: () async {
                    await FirebaseFirestore.instance
                        .collection('users')
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .update({
                      "promoCodes": controller.text,
                      "uid": FirebaseAuth.instance.currentUser!.uid,
                      "blocked": false,
                      "paid": true,
                      "count": 3,
                      "subscriptionType": "Monthly",
                      "price": "15.99",
                      "subscriptionTaken": true
                    }).then((value) => {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (builder) => MonthlyWebPage(
                                            title: "Monthly",
                                            url:
                                                " https://checkout.stripe.com/c/pay/cs_live_b1h3HdLi5vUcJmTcHJM0ExMMo0CCkhlt6qgr8pk4s30kXD2l4wDI7HMfk1#fidkdWxOYHwnPyd1blppbHNgWmhrQEhXXWdpMTdETnVgckpJQHBHX0F%2FQScpJ3VpbGtuQH11anZgYUxhJz8nM2pAMW9%2FPFJGM0FcNFQxNTU0Jyknd2BjYHd3YHdKd2xibGsnPydtcXF1Pyoqdm5sdmhsK2ZqaConeCUl ",
                                          )))
                            });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xffFDDC5C),
                        borderRadius: BorderRadius.circular(25)),
                    width: 150,
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Monthly",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("\$ 15.99")
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () async {
                await FirebaseFirestore.instance
                    .collection('users')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .update({
                  "promoCodes": controller.text,
                  "uid": FirebaseAuth.instance.currentUser!.uid,
                  "blocked": false,
                  "paid": true,
                  "count": 3,
                  "subscriptionType": "Yearly",
                  'price': "69.99",
                  "subscriptionTaken": true
                }).then((value) => {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => YearlyWebPage(
                                        title: "Yearly",
                                        url:
                                            "Annual: https://checkout.stripe.com/c/pay/cs_live_b15J9bBXB1QJpf5XeiLRcL991oOiXrqUtnOddG1PVt5O9ZmQ6qYEulY3Rx#fidkdWxOYHwnPyd1blppbHNgWmhrQEhXXWdpMTdETnVgckpJQHBHX0F%2FQScpJ3VpbGtuQH11anZgYUxhJz8nY19gMW9%2FZzVCN2tMZ3RANz1kJyknd2BjYHd3YHdKd2xibGsnPydtcXF1Pyoqdm5sdmhsK2ZqaConeCUl ",
                                      )))
                        });
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xffFDDC5C),
                    borderRadius: BorderRadius.circular(25)),
                width: 150,
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Yearly",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("\$ 69.99")
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  //Payment Function
}
