import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:skismi/main_screen.dart';
import 'package:skismi/payment/subcription_ask.dart';
import 'package:skismi/status/blockuser.dart';

class CheckSubscription extends StatefulWidget {
  const CheckSubscription({super.key});

  @override
  State<CheckSubscription> createState() => _CheckSubscriptionState();
}

class _CheckSubscriptionState extends State<CheckSubscription> {
  final DocumentReference userRef = FirebaseFirestore.instance
      .collection('subscriptions')
      .doc(FirebaseAuth.instance.currentUser!.uid);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Checking Users Payment Status"),
      ),
    );
  }

  void check() async {
    final DocumentSnapshot userSnapshot = await userRef.get();
    Map<String, dynamic> data = userSnapshot.data() as Map<String, dynamic>;

    ;
    final isBlocked = data['paid'];
    if (isBlocked == true) {
      // User is blocked
      Navigator.push(
          context, MaterialPageRoute(builder: (builder) => MainScreen()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (builder) => SubsriptionAsk()));
    }
  }
}

// // Reference to the user's document
// final DocumentReference userRef = FirebaseFirestore.instance.collection('users').doc('user_id');

// // Query the user's document
// final DocumentSnapshot userSnapshot = await userRef.get();

// // Check if the user is blocked or unblocked
// final bool isBlocked = userSnapshot.data()['blocked'];

// if (isBlocked) {
//   // User is blocked
// } else {
//   // User is unblocked
// }

// import 'package:cloud_firestore/cloud_firestore.dart';

// // Reference to the user's document
// final DocumentReference userRef = FirebaseFirestore.instance.collection('users').doc('user_id');

// // Query the user's document
// final DocumentSnapshot userSnapshot = await userRef.get();

// // Check if the user is blocked or unblocked
// final bool isBlocked = userSnapshot.data()['blocked'];


