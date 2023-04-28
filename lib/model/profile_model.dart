import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileModel {
  String uid;
  bool blocked;
  String firstname;
  String lastname;
  String phonenumber;
  bool paid;
  int count;

  ProfileModel({
    required this.phonenumber,
    required this.uid,
    required this.lastname,
    required this.blocked,
    required this.firstname,
    required this.paid,
    required this.count,
  });

  ///Converting OBject into Json Object
  Map<String, dynamic> toJson() => {
        'uid': uid,
        'paid': paid,
        'blocked': blocked,
        'lastname': lastname,
        'firstname': firstname,
        'phonenumber': phonenumber,
        'count': count
      };

  ///
  static ProfileModel fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return ProfileModel(
        phonenumber: snapshot['phonenumber'],
        paid: snapshot['paid'],
        uid: snapshot['uid'],
        count: snapshot['count'],
        blocked: snapshot['blocked'],
        lastname: snapshot['lastname'],
        firstname: snapshot['firstname']);
  }
}
