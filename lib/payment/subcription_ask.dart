import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skismi/main_screen.dart';
import 'package:intl/intl.dart';
import 'package:skismi/messages/chat_screen.dart';

class SubsriptionAsk extends StatefulWidget {
  SubsriptionAsk({super.key});

  @override
  State<SubsriptionAsk> createState() => _SubsriptionAskState();
}

class _SubsriptionAskState extends State<SubsriptionAsk> {
  Map<String, dynamic>? paymentIntent;
  int selectedIndex = 0;
  DateTime now = DateTime.now();
  String startMonth = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String endMonth = DateFormat('yyyy-MM-dd').format(DateTime.now());

  String startYear = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String endYear = DateFormat('yyyy-MM-dd').format(DateTime.now());

  String formattedStartOfWeek = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String formattedEndOfWeek = DateFormat('yyyy-MM-dd').format(DateTime.now());

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
      body: Column(
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
                onTap: () async {
                  await makePayment("799").then((value) async {
                    await FirebaseFirestore.instance
                        .collection("subscriptions")
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .set({
                      "type": "Weekly",
                      "amount": "7.99",
                      "uid": FirebaseAuth.instance.currentUser!.uid,
                      "startDate": formattedStartOfWeek,
                      "endDate": formattedEndOfWeek,
                      "paid": true
                    });
                  }).then((value) async {
                    await FirebaseFirestore.instance
                        .collection('users')
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .update({"paid": true});
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (builder) =>
                                ChatScreen(name: "", uuid: "")));
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
                  await makePayment("1599").then((value) async {
                    await FirebaseFirestore.instance
                        .collection("subscriptions")
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .set({
                      "type": "Monthly",
                      "amount": "15.99",
                      "uid": FirebaseAuth.instance.currentUser!.uid,
                      "startDate": startMonth,
                      "endDate": endMonth,
                      "paid": true
                    });
                  }).then((value) async {
                    await FirebaseFirestore.instance
                        .collection('users')
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .update({"paid": true});
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (builder) =>
                                ChatScreen(name: "", uuid: "")));
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
              await makePayment("6999").then((value) async {
                await FirebaseFirestore.instance
                    .collection("subscriptions")
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .set({
                  "type": "Yearly",
                  "amount": "69.99",
                  "uid": FirebaseAuth.instance.currentUser!.uid,
                  "startDate": startYear,
                  "paid": true,
                  "endDate": endYear
                });
              }).then((value) async {
                await FirebaseFirestore.instance
                    .collection('users')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .update({"paid": true});
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => ChatScreen(name: "", uuid: "")));
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
    );
  }

  //Payment Function
  Future<void> makePayment(String amount) async {
    try {
      paymentIntent = await createPaymentIntent(amount, 'USD');

      var gpay = PaymentSheetGooglePay(
          merchantCountryCode: "US", currencyCode: "USD", testEnv: true);

      //STEP 2: Initialize Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret: paymentIntent![
                      'client_secret'], //Gotten from payment intent
                  style: ThemeMode.light,
                  merchantDisplayName: 'Abhi',
                  googlePay: gpay))
          .then((value) {});

      //STEP 3: Display Payment sheet
      displayPaymentSheet();
    } catch (err) {
      print(err);
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) async {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          "Payment Successfully",
          style: TextStyle(color: Colors.white),
        )));
      });
    } catch (e) {
      print('$e');
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer sk_test_1AuH6JvVPa2YbtyuyulwaZ0F',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      return json.decode(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }
}
