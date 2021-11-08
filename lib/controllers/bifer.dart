import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pmms/Mentors/Home_Screen_Mentor.dart';
import 'package:pmms/Students/HomePage/Homepage.dart';

class bifer extends StatefulWidget {
  @override
  _biferState createState() => _biferState();
}

class _biferState extends State<bifer> {
  String myrole;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: _fetchrole(),
        builder: (context,snapshot) {
          if(snapshot.connectionState != ConnectionState.done)
            return CircularProgressIndicator();
          if('$myrole' == "faculty") {
            return Home_Page_Mentor();
          } else if('$myrole' == "student"){
            return Home_Page();
          }
          //If HOD IS THERE SO PLEASE ADD $MYROLL == "HOD" AND REDIRECT TO HOD PAGE
        },
      ),
    );
  }

  // _fetchpage() {
  //   if()
  // }

  _fetchrole() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser();
    if(firebaseUser != null)
      await Firestore.instance
          .collection('users')
          .document(firebaseUser.uid)
          .get()
          .then((ds) {
        myrole = ds.data['role'];
        return myrole;
      }).catchError((e) {
        print(e);
      });
  }

}
