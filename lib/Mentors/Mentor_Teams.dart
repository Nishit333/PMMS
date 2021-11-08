// Importing Libraries And Packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Constants.dart';
import 'Home_Screen_Mentor.dart';

// Main Widget Topics Is Created
class Mentor_Teams_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff063970),
      body: Body(),
    );
  }
}

// Creating Body Widget For Displaying Content
class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String mygid1, mydef1, mygid2, mydef2;

  @override
  Widget build(BuildContext context) {
    //
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,

              // Back Arrow Widget
              children: [
                IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      size: 35,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Home_Page_Mentor()));
                    }),
              ],
            ),
          ),

          // Displaying Text On The Page in Column
          Container(
            margin: EdgeInsets.only(left: 10.0),
            child: Column(
              children: [
                Text(
                  "Teams Under",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  "Supervision",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15.0,
          ),

          // Creating Container To Display The Option Between Sem 7 and 8
          Container(
            height: height * 0.7549,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35.0),
                  topRight: Radius.circular(35.0)),
              color: Colors.grey[200],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: height * 0.0001),
                Container(
                  height: height * 0.75,
                  width: width * 0.8,

                  // Creating Options Widget And Calling Using Child
                  child: Column(
                    children: [
                      SizedBox(height: 35.0),
                      Container(
                        height: 200.0,
                        width: 600.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0.4, 1],
                            colors: [Color(0xffff8448), Color(0xfff7b361)],
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              SizedBox(height: 8.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 35,
                                    child: Image(
                                      image: AssetImage(
                                          'assets/Common_Images/Team.png'),
                                    ),
                                  ),
                                  SizedBox(width: 5.0),
                                  Text(
                                    "Team 1",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Divider(thickness: 2.0, color: Colors.white),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  children: [
                                    SizedBox(height: 2.0),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text("Group Id : ",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.bold,
                                            )),
                                        FutureBuilder(
                                          future: _fetchgid1(),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState !=
                                                ConnectionState.done)
                                              return Text("Loading");
                                            return Text("$mygid1",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                ));
                                          },
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 6.0),
                                    Column(
                                      children: [
                                        Text("Project Defination :",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.bold,
                                            )),
                                        FutureBuilder(
                                          future: _fetchgid1(),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState !=
                                                ConnectionState.done)
                                              return Text("Loading");
                                            return Text("$mydef1",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                ));
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height:35.0),
                      Container(
                        height: 200.0,
                        width: 600.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0.4, 1],
                            colors: [Color(0xffff8448), Color(0xfff7b361)],
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              SizedBox(height: 8.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 35,
                                    child: Image(
                                      image: AssetImage(
                                          'assets/Common_Images/Team.png'),
                                    ),
                                  ),
                                  SizedBox(width: 5.0),
                                  Text(
                                    "Team 2",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Divider(thickness: 2.0, color: Colors.white),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  children: [
                                    SizedBox(height: 2.0),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Text("Group Id : ",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.bold,
                                            )),
                                        FutureBuilder(
                                          future: _fetchgid2(),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState !=
                                                ConnectionState.done)
                                              return Text("Loading");
                                            return Text("$mygid2",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                ));
                                          },
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 6.0),
                                    Column(
                                      children: [
                                        Text("Project Defination :",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.bold,
                                            )),
                                        FutureBuilder(
                                          future: _fetchgid2(),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState !=
                                                ConnectionState.done)
                                              return Text("Loading");
                                            return Text("$mydef2",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                ));
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _fetchgid1() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser();
    if (firebaseUser != null)
      await Firestore.instance
          .collection('users')
          .document(firebaseUser.uid)
          .get()
          .then((ds) {
        mygid1 = ds.data['gid1'].toString();
        _fetchdef1(mygid1);
      }).catchError((e) {
        print(e);
      });
  }

  _fetchdef1(mygid1) async {
    await Firestore.instance
        .collection('gid')
        .document("$mygid1")
        .get()
        .then((ds) {
      mydef1 = ds.data['Project Defination'];
      return mydef1;
    }).catchError((e) {
      print(e);
    });
  }

  _fetchgid2() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser();
    if (firebaseUser != null)
      await Firestore.instance
          .collection('users')
          .document(firebaseUser.uid)
          .get()
          .then((ds) {
        mygid2 = ds.data['gid2'].toString();
        _fetchdef2(mygid2);
      }).catchError((e) {
        print(e);
      });
  }

  _fetchdef2(mygid2) async {
    await Firestore.instance
        .collection('gid')
        .document("$mygid2")
        .get()
        .then((ds) {
      mydef2 = ds.data['Project Defination'];
      return mydef2;
    }).catchError((e) {
      print(e);
    });
  }

}
