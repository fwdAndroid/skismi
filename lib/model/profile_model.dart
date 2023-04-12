import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileModel {
  String uid;
  bool blocked;
  String firstname;
  String lastname;
  String phonenumber;

  ProfileModel({
    required this.phonenumber,
    required this.uid,
    required this.lastname,
    required this.blocked,
    required this.firstname,
  });

  ///Converting OBject into Json Object
  Map<String, dynamic> toJson() => {
        'uid': uid,
        'blocked': blocked,
        'lastname': lastname,
        'firstname': firstname,
        'phonenumber': phonenumber
      };

  ///
  static ProfileModel fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return ProfileModel(
        phonenumber: snapshot['phonenumber'],
        uid: snapshot['uid'],
        blocked: snapshot['blocked'],
        lastname: snapshot['lastname'],
        firstname: snapshot['firstname']);
  }
}
