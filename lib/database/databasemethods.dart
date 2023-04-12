import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:skismi/model/profile_model.dart';

class DatabaseMethods {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future checkDocuement(String docID) async {
    final snapShot = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid) // varuId in your case
        .get();

    if (snapShot == null || !snapShot.exists) {
      // docuement is not exist
      print('id is not exist');
    } else {
      print("id is really exist");
    }
  }

//Add Google
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

//OTP Number Add
  Future<String> numberAdd() async {
    String res = 'Some error occured';
    try {
      //Add User to the database with modal
      ProfileModel userModel = ProfileModel(
        uid: FirebaseAuth.instance.currentUser!.uid,
        blocked: false,
        firstname: '',
        lastname: '',
        phonenumber: '',
      );
      await firebaseFirestore
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(
            userModel.toJson(),
          );
      res = 'success';
      debugPrint(res);
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  //Profile Details
  Future<String> profileDetail({
    required String uid,
    required String firstName,
    required String lastName,
    required bool blocked,
    required String phoneNumber,
  }) async {
    String res = 'Some error occured';

    try {
      //Add User to the database with modal

      ProfileModel userModel = ProfileModel(
        firstname: firstName,
        lastname: lastName,
        phonenumber: phoneNumber,
        blocked: blocked,
        uid: FirebaseAuth.instance.currentUser!.uid,
      );
      await firebaseFirestore
          .collection('users')
          .doc(uid)
          .update(userModel.toJson());

      res = 'success';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
