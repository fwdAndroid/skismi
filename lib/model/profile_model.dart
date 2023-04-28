import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileModel {
  String uid;
  bool? subscriptionTaken;
  String? firstname;
  String? lastname;
  int promoCodes;
  String? phonenumber;
  bool paid;
  bool blocked;
  int count;
  String? subscriptionType;
  String? email;
  String? price;

  ProfileModel(
      {this.phonenumber,
      required this.promoCodes,
      required this.uid,
      this.lastname,
      this.subscriptionTaken,
      this.firstname,
      required this.blocked,
      required this.paid,
      required this.count,
      this.email,
      this.price,
      this.subscriptionType});

  ///Converting OBject into Json Object
  Map<String, dynamic> toJson() => {
        'phonenumber': phonenumber,
        'uid': uid,
        'lastname': lastname,
        'subscriptionTaken': subscriptionTaken,
        'firstname': firstname,
        'paid': paid,
        'count': count,
        'email': email,
        'promoCodes': promoCodes,
        'price': price,
        'blocked': blocked,
        'subscriptionType': subscriptionType
      };

  ///
  static ProfileModel fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return ProfileModel(
        phonenumber: snapshot['phonenumber'],
        uid: snapshot['uid'],
        lastname: snapshot['lastname'],
        subscriptionTaken: snapshot['subscriptionTaken'],
        firstname: snapshot['firstname'],
        paid: snapshot['paid'],
        promoCodes: snapshot['promoCodes'],
        blocked: snapshot['blocked'],
        count: snapshot['count'],
        email: snapshot['email'],
        price: snapshot['price'],
        subscriptionType: snapshot['subscriptionType']);
  }
}
