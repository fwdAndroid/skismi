import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skismi/main_screen.dart';

class SubsriptionAsk extends StatefulWidget {
  const SubsriptionAsk({super.key});

  @override
  State<SubsriptionAsk> createState() => _SubsriptionAskState();
}

class _SubsriptionAskState extends State<SubsriptionAsk> {
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
                  await makePayment('7');
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
                  await makePayment('15');
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
              await makePayment('69');
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
  Future<void> makePayment(var amounts) async {
    try {
      paymentIntent = await createPaymentIntent(amounts, 'USD');

      //STEP 2: Initialize Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret:
                paymentIntent!['client_secret'], //Gotten from payment intent
            style: ThemeMode.light,
            merchantDisplayName: 'Abhi',
          ))
          .then((value) {});

      //STEP 3: Display Payment sheet
      displayPaymentSheet();
    } catch (err) {
      print(err);
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          "Payment Done",
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
          'Authorization':
              'Bearer sk_test_51MWx8OAVMyklfe3C3gP4wKOhTsRdF6r1PYhhg1PqupXDITMrV3asj5Mmf0G5F9moPL6zNfG3juK8KHgV9XNzFPlq00wmjWwZYA',
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
