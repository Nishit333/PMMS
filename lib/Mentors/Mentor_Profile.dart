import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pmms/Students/DashBoard/Constants.dart';

import 'Home_Screen_Mentor.dart';

const DeepBlue = Color(0xff35548e);

class Mentor_Profile extends StatefulWidget {
  @override
  _Mentor_ProfileState createState() => _Mentor_ProfileState();
}

class _Mentor_ProfileState extends State<Mentor_Profile> {

  String myName,mydept,myen,myspec,mycont;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            color: DeepBlue,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 60),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(icon: Arrow_Back,
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Home_Page_Mentor()));
                          }
                      ),
                    ],
                  ),
                  Text(
                    'My Profile',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: height * 0.38,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double innerWidth = constraints.maxWidth;
                        double innerHeight = constraints.maxHeight;
                        return Stack(
                          fit: StackFit.expand,
                          children: [
                            Positioned(
                              right: 0,
                              left: 0,
                              bottom: 0,
                              child: Container(
                                height: innerHeight * 0.7,
                                width: innerWidth,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.grey[200],
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(height: 70),
                                    FutureBuilder(
                                      future: _fetchname(),
                                      builder: (context,snapshot) {
                                        if(snapshot.connectionState != ConnectionState.done)
                                          return Text("Loading");
                                        return Text("$myName",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 25
                                            ));
                                      },
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              'Department',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 25,
                                              ),
                                            ),
                                            FutureBuilder(
                                              future: _fetchdept(),
                                              builder: (context,snapshot) {
                                                if(snapshot.connectionState != ConnectionState.done)
                                                  return Text("Loading");
                                                return Text("$mydept",
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 25
                                                    ));
                                              },
                                            )
                                          ],
                                        ),
                                        Padding(padding: const EdgeInsets.symmetric(
                                          horizontal: 25,
                                          vertical: 8,
                                        ),
                                          child: Container(
                                            height: 50,
                                            width: 3,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(100),
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              'Mentor_ID',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 25,
                                              ),
                                            ),
                                            // Text(
                                            //   '80',
                                            //   textAlign: TextAlign.center,
                                            //   style: TextStyle(
                                            //     color: Colors.black,
                                            //     fontSize: 25,
                                            //   ),
                                            // ),
                                            FutureBuilder(
                                              future: _fetchenroll(),
                                              builder: (context,snapshot) {
                                                if(snapshot.connectionState != ConnectionState.done)
                                                  return Text("Loading");
                                                return Text("$myen",
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 25
                                                    ));
                                              },
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: Container(
                                  child: Image.asset(
                                    'assets/Profile_Images/Profile.png',
                                    width: innerWidth * 0.4,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    height: height * 0.25,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.grey[200],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Specialization',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                            ),
                          ),
                          SizedBox( height: 10),
                          Container(
                            height: height * 0.15,
                            width: width * 0.83,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: FutureBuilder(
                              future: _fetchspec(),
                              builder: (context,snapshot) {
                                if(snapshot.connectionState != ConnectionState.done)
                                  return Text("Loading");
                                return Text("$myspec",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25
                                    ));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    height: height * 0.20,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.grey[200],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Contact Information',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                            ),
                          ),
                          SizedBox( height: 10),
                          Container(
                            height: height * 0.105,
                            width: width * 0.83,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: FutureBuilder(
                              future: _fetchcont(),
                              builder: (context,snapshot) {
                                if(snapshot.connectionState != ConnectionState.done)
                                  return Text("Loading");
                                return Text("$mycont",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25
                                    ));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  _fetchname() async{
    final firebaseUser = await FirebaseAuth.instance.currentUser();
    if(firebaseUser != null)
      await Firestore.instance
          .collection('users')
          .document(firebaseUser.uid)
          .get()
          .then((ds) {
        myName = ds.data['Name'];
        return myName;
      }).catchError((e) {
        print(e);
      });
  }

  _fetchdept() async{
    final firebaseUser = await FirebaseAuth.instance.currentUser();
    if(firebaseUser != null)
      await Firestore.instance
          .collection('users')
          .document(firebaseUser.uid)
          .get()
          .then((ds) {
        mydept = ds.data['Department'];
        return mydept;
      }).catchError((e) {
        print(e);
      });
  }

  _fetchenroll() async{
    final firebaseUser = await FirebaseAuth.instance.currentUser();
    if(firebaseUser != null)
      await Firestore.instance
          .collection('users')
          .document(firebaseUser.uid)
          .get()
          .then((ds) {
        myen = ds.data['Enrollment'].toString();
        return myen;
      }).catchError((e) {
        print(e);
      });
  }

  _fetchspec() async{
    final firebaseUser = await FirebaseAuth.instance.currentUser();
    if(firebaseUser != null)
      await Firestore.instance
          .collection('users')
          .document(firebaseUser.uid)
          .get()
          .then((ds) {
        myspec = ds.data['Specialization'];
        return myspec;
      }).catchError((e) {
        print(e);
      });
  }

  _fetchcont() async{
    final firebaseUser = await FirebaseAuth.instance.currentUser();
    if(firebaseUser != null)
      await Firestore.instance
          .collection('users')
          .document(firebaseUser.uid)
          .get()
          .then((ds) {
        mycont = ds.data['Contact'];
        return mycont;
      }).catchError((e) {
        print(e);
      });
  }

}
