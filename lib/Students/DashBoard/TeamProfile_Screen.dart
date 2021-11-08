import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pmms/Students/HomePage/Homepage.dart';

const DeepBlue = Color(0xff35548e);

class TeamProfile_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DeepBlue,
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String mygid, mydef, mymentorid, mymentorname, mymentordept;

  @override
  Widget build(BuildContext context) {
    List cardList = [Item1(), Item2(), Item3(), Item4()];

    List<T> map<T>(List list, Function handler) {
      List<T> result = [];
      for (var i = 0; i < list.length; i++) {
        result.add(handler(i, list[i]));
      }
      return result;
    }

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      size: 35,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home_Page()));
                    }),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0),
            child: Column(
              children: [
                Text(
                  "Team_ID",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  'Members',
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
          Container(
            height: height * 0.7549,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35.0),
                  topRight: Radius.circular(35.0)),
              color: Colors.white,
            ),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 15.0),
                Text(
                  "Details Of Members",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    //fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
                SizedBox(height: 5.0),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    pauseAutoPlayOnTouch: true,
                    aspectRatio: 2.0,
                    onPageChanged: (index, reason) {},
                  ),
                  items: cardList.map((card) {
                    return Builder(builder: (BuildContext context) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35.0),
                          ),
                          color: Colors.black,
                          child: card,
                          shadowColor: Colors.grey,
                        ),
                      );
                    });
                  }).toList(),
                ),
                SizedBox(height: 20.0),
                Container(
                  height: height * 0.15,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.3, 0.7, 1],
                        colors: [
                          Color(0xff35548e),
                          Color(0xff5d8fdd),
                          Color(0xff6494dc)
                        ],
                      ),
                      boxShadow: [
                        new BoxShadow(
                          color: Colors.grey,
                          blurRadius: 7.0,
                          offset: Offset(6.0, 6.0),
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: height * 0.035,
                              child: Image(
                                  image: AssetImage(
                                'assets/TimeLine_Images/Definition.png',
                              )),
                            ),
                            SizedBox(width: 5.0),
                            Text(
                              'Definition',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                        Divider(thickness: 2, color: Colors.white),
                        SizedBox(height: 5),
                        // Text(
                        //   'PMMS - Project Monitoring And Management System',
                        //   textAlign: TextAlign.center,
                        //   style: TextStyle(
                        //     color: Colors.white,
                        //     fontSize: 20,
                        //   ),
                        // ),
                        FutureBuilder(
                          future: _fetchgid(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState !=
                                ConnectionState.done) return Text("Loading");
                            return Text("$mydef",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ));
                          },
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  height: height * 0.17,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.3, 0.7, 1],
                      colors: [
                        Color(0xff35548e),
                        Color(0xff5d8fdd),
                        Color(0xff6494dc)
                      ],
                    ),
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.grey,
                        blurRadius: 7.0,
                        offset: Offset(6.0, 6.0),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: height * 0.035,
                              child: Image(
                                  image: AssetImage(
                                'assets/AppDrawer_Images/Mentor.png',
                              )),
                            ),
                            SizedBox(width: 5.0),
                            Text(
                              'Mentor Details',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                        Divider(thickness: 2, color: Colors.white),
                        SizedBox(height: 5.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Row(
                            children: [
                              Text("Name :- ",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22.0,
                                    //fontWeight: FontWeight.w600
                                  )),
                              // Text(
                              //     "Awdesh Dixit",
                              //     textAlign: TextAlign.start,
                              //     style: TextStyle(
                              //       color: Colors.white,
                              //       fontSize: 22.0,
                              //       //fontWeight: FontWeight.w600
                              //     )
                              // ),
                              FutureBuilder(
                                future: _fetchgid(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState !=
                                      ConnectionState.done)
                                    return Text("Loading");
                                  return Text("$mymentorname",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 22.0));
                                },
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 6.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Row(
                            children: [
                              Text("Department :- ",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22.0,
                                    //fontWeight: FontWeight.w600
                                  )),
                              // Text(
                              //     "IT ",
                              //     textAlign: TextAlign.start,
                              //     style: TextStyle(
                              //       color: Colors.white,
                              //       fontSize: 22.0,
                              //       //fontWeight: FontWeight.w600
                              //     )
                              // ),
                              FutureBuilder(
                                future: _fetchgid(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState !=
                                      ConnectionState.done)
                                    return Text("Loading");
                                  return Text("$mymentordept",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w600));
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _fetchgid() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser();
    if (firebaseUser != null)
      await Firestore.instance
          .collection('users')
          .document(firebaseUser.uid)
          .get()
          .then((ds) {
        mygid = ds.data['gid'].toString();
        _fetchdef(mygid);
        _fetchmenid(mygid);
      }).catchError((e) {
        print(e);
      });
  }

  _fetchdef(mygid) async {
    await Firestore.instance
        .collection('gid')
        .document("$mygid")
        .get()
        .then((ds) {
      mydef = ds.data['Project Defination'];
      return mydef;
    }).catchError((e) {
      print(e);
    });
  }

  _fetchmenid(mygid) async {
    await Firestore.instance
        .collection('gid')
        .document("$mygid")
        .get()
        .then((ds) {
      mymentorid = ds.data['Mentor Id'];
      return _fetchmen(mymentorid);
    }).catchError((e) {
      print(e);
    });
  }

  _fetchmen(mymentorid) async {
    await Firestore.instance
        .collection('users')
        .document("$mymentorid")
        .get()
        .then((ds) {
      mymentorname = ds.data['Name'];
      mymentordept = ds.data['Department'];
      return [mymentorname, mymentordept];
    }).catchError((e) {
      print(e);
    });
  }
}

class Item1 extends StatelessWidget {
  // const Item1({Key key}) : super(key: key);
  String mygid,
      mymemberenrollment,
      mymemberen,
      mymembername,
      mymemberdept,
      mymemberdegree;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
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
                  height: 25,
                  child: Image(
                    image: AssetImage('assets/Mentors_Images/User.png'),
                  ),
                ),
                SizedBox(width: 5.0),
                Text(
                  "Member 1",
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 2.0),
                  Row(
                    children: [
                      Text("Name :- ",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            //fontWeight: FontWeight.w600
                          )),
                      // Text(
                      //     "Mistry Suraj",
                      //     textAlign: TextAlign.start,
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 22.0,
                      //       //fontWeight: FontWeight.w600
                      //     )
                      // ),
                      FutureBuilder(
                        future: _fetchgid(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState != ConnectionState.done)
                            return Text("Loading");
                          return Text("$mymembername",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 22.0));
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 6.0),
                  Row(
                    children: [
                      Text("ID :- ",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            //fontWeight: FontWeight.w600
                          )),
                      // Text(
                      //     "170303108044 ",
                      //     textAlign: TextAlign.start,
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 22.0,
                      //       //fontWeight: FontWeight.w600
                      //     )
                      // ),
                      FutureBuilder(
                        future: _fetchgid(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState != ConnectionState.done)
                            return Text("Loading");
                          return Text("$mymemberen",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 22.0));
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 6.0),
                  Row(
                    children: [
                      Text("Department :- ",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            //fontWeight: FontWeight.w600
                          )),
                      // Text(
                      //     "IT ",
                      //     textAlign: TextAlign.start,
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 22.0,
                      //       //fontWeight: FontWeight.w600
                      //     )
                      // ),
                      FutureBuilder(
                        future: _fetchgid(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState != ConnectionState.done)
                            return Text("Loading");
                          return Text("$mymemberdept",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 22.0));
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 6.0),
                  Row(
                    children: [
                      Text("Degree:- ",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            //fontWeight: FontWeight.w600
                          )),
                      FutureBuilder(
                        future: _fetchgid(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState != ConnectionState.done)
                            return Text("Loading");
                          return Text("$mymemberdegree",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 22.0));
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _fetchgid() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser();
    if (firebaseUser != null)
      await Firestore.instance
          .collection('users')
          .document(firebaseUser.uid)
          .get()
          .then((ds) {
        mygid = ds.data['gid'].toString();
        _fetchmemberenrollment(mygid);
      }).catchError((e) {
        print(e);
      });
  }

  _fetchmemberenrollment(mygid) async {
    await Firestore.instance
        .collection('gid')
        .document("$mygid")
        .get()
        .then((ds) {
      mymemberenrollment = ds.data['Member1'].toString();
      return _fetchmember(mymemberenrollment);
    }).catchError((e) {
      print(e);
    });
  }

  _fetchmember(mymemberenrollment) async {
    await Firestore.instance
        .collection('users')
        .getDocuments()
        .then((snapshot) {
      snapshot.documents.forEach((doc) {
        if (doc.data['Enrollment'].toString() ==
            mymemberenrollment.toString()) {
          mymembername = doc.data['Name'].toString();
          mymemberen = doc.data['Enrollment'].toString();
          mymemberdept = doc.data['Department'].toString();
          mymemberdegree = doc.data['Degree'].toString();
          return [mymembername, mymemberen, mymemberdept, mymemberdegree];
        }
      });
    });
  }
}

class Item2 extends StatelessWidget {
  // const Item2({Key key}) : super(key: key);
  String mygid,
      mymemberenrollment,
      mymemberen,
      mymembername,
      mymemberdept,
      mymemberdegree;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
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
                  height: 25,
                  child: Image(
                    image: AssetImage('assets/Mentors_Images/User.png'),
                  ),
                ),
                SizedBox(width: 5.0),
                Text(
                  "Member 2",
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 2.0),
                  Row(
                    children: [
                      Text("Name :- ",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            //fontWeight: FontWeight.w600
                          )),
                      // Text(
                      //     "Nishit Langaliya",
                      //     textAlign: TextAlign.start,
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 22.0,
                      //       //fontWeight: FontWeight.w600
                      //     )
                      // ),
                      FutureBuilder(
                        future: _fetchgid(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState != ConnectionState.done)
                            return Text("Loading");
                          return Text("$mymembername",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 22.0));
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 6.0),
                  Row(
                    children: [
                      Text("ID :- ",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            //fontWeight: FontWeight.w600
                          )),
                      // Text(
                      //     "170303108032",
                      //     textAlign: TextAlign.start,
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 22.0,
                      //       //fontWeight: FontWeight.w600
                      //     )
                      // ),
                      FutureBuilder(
                        future: _fetchgid(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState != ConnectionState.done)
                            return Text("Loading");
                          return Text("$mymemberen",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 22.0));
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 6.0),
                  Row(
                    children: [
                      Text("Department :- ",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            //fontWeight: FontWeight.w600
                          )),
                      // Text(
                      //     "IT ",
                      //     textAlign: TextAlign.start,
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 22.0,
                      //       //fontWeight: FontWeight.w600
                      //     )
                      // ),
                      FutureBuilder(
                        future: _fetchgid(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState != ConnectionState.done)
                            return Text("Loading");
                          return Text("$mymemberdept",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 22.0));
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 6.0),
                  Row(
                    children: [
                      Text("Degree:- ",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            //fontWeight: FontWeight.w600
                          )),
                      FutureBuilder(
                        future: _fetchgid(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState != ConnectionState.done)
                            return Text("Loading");
                          return Text("$mymemberdegree",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 22.0));
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _fetchgid() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser();
    if (firebaseUser != null)
      await Firestore.instance
          .collection('users')
          .document(firebaseUser.uid)
          .get()
          .then((ds) {
        mygid = ds.data['gid'].toString();
        _fetchmemberenrollment(mygid);
      }).catchError((e) {
        print(e);
      });
  }

  _fetchmemberenrollment(mygid) async {
    await Firestore.instance
        .collection('gid')
        .document("$mygid")
        .get()
        .then((ds) {
      mymemberenrollment = ds.data['Member2'].toString();
      return _fetchmember(mymemberenrollment);
    }).catchError((e) {
      print(e);
    });
  }

  _fetchmember(mymemberenrollment) async {
    await Firestore.instance
        .collection('users')
        .getDocuments()
        .then((snapshot) {
      snapshot.documents.forEach((doc) {
        if (doc.data['Enrollment'].toString() ==
            mymemberenrollment.toString()) {
          mymembername = doc.data['Name'].toString();
          mymemberen = doc.data['Enrollment'].toString();
          mymemberdept = doc.data['Department'].toString();
          mymemberdegree = doc.data['Degree'].toString();
          return [mymembername, mymemberen, mymemberdept, mymemberdegree];
        }
      });
    });
  }
}

class Item3 extends StatelessWidget {
  // const Item3({Key key}) : super(key: key);
  String mygid,
      mymemberenrollment,
      mymemberen,
      mymembername,
      mymemberdept,
      mymemberdegree;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
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
                  height: 25,
                  child: Image(
                    image: AssetImage('assets/Mentors_Images/User.png'),
                  ),
                ),
                SizedBox(width: 5.0),
                Text(
                  "Member 3",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(thickness: 2.0, color: Colors.white),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 2.0),
                  Row(
                    children: [
                      Text("Name : ",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            //fontWeight: FontWeight.w600
                          )),
                      // Text(
                      //     "Darshan Mankodi",
                      //     textAlign: TextAlign.start,
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 22.0,
                      //       //fontWeight: FontWeight.w600
                      //     )
                      // ),
                      FutureBuilder(
                        future: _fetchgid(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState != ConnectionState.done)
                            return Text("Loading");
                          return Text("$mymembername",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 22.0));
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 6.0),
                  Row(
                    children: [
                      Text("ID :- ",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            //fontWeight: FontWeight.w600
                          )),
                      // Text(
                      //     "170303108037 ",
                      //     textAlign: TextAlign.start,
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 22.0,
                      //       //fontWeight: FontWeight.w600
                      //     )
                      // ),
                      FutureBuilder(
                        future: _fetchgid(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState != ConnectionState.done)
                            return Text("Loading");
                          return Text("$mymemberen",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 22.0));
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 6.0),
                  Row(
                    children: [
                      Text("Department :- ",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            //fontWeight: FontWeight.w600
                          )),
                      // Text(
                      //     "IT ",
                      //     textAlign: TextAlign.start,
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 22.0,
                      //       //fontWeight: FontWeight.w600
                      //     )
                      // ),
                      FutureBuilder(
                        future: _fetchgid(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState != ConnectionState.done)
                            return Text("Loading");
                          return Text("$mymemberdept",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 22.0));
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 6.0),
                  Row(
                    children: [
                      Text("Degree:- ",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            //fontWeight: FontWeight.w600
                          )),
                      FutureBuilder(
                        future: _fetchgid(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState != ConnectionState.done)
                            return Text("Loading");
                          return Text("$mymemberdegree",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 22.0));
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _fetchgid() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser();
    if (firebaseUser != null)
      await Firestore.instance
          .collection('users')
          .document(firebaseUser.uid)
          .get()
          .then((ds) {
        mygid = ds.data['gid'].toString();
        _fetchmemberenrollment(mygid);
      }).catchError((e) {
        print(e);
      });
  }

  _fetchmemberenrollment(mygid) async {
    await Firestore.instance
        .collection('gid')
        .document("$mygid")
        .get()
        .then((ds) {
      mymemberenrollment = ds.data['Member3'].toString();
      return _fetchmember(mymemberenrollment);
    }).catchError((e) {
      print(e);
    });
  }

  _fetchmember(mymemberenrollment) async {
    await Firestore.instance
        .collection('users')
        .getDocuments()
        .then((snapshot) {
      snapshot.documents.forEach((doc) {
        if (doc.data['Enrollment'].toString() ==
            mymemberenrollment.toString()) {
          mymembername = doc.data['Name'].toString();
          mymemberen = doc.data['Enrollment'].toString();
          mymemberdept = doc.data['Department'].toString();
          mymemberdegree = doc.data['Degree'].toString();
          return [mymembername, mymemberen, mymemberdept, mymemberdegree];
        }
      });
    });
  }
}

class Item4 extends StatelessWidget {
  // const Item4({Key key}) : super(key: key);
  String mygid,
      mymemberenrollment,
      mymemberen,
      mymembername,
      mymemberdept,
      mymemberdegree;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
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
                  height: 25,
                  child: Image(
                    image: AssetImage('assets/Mentors_Images/User.png'),
                  ),
                ),
                SizedBox(width: 5.0),
                Text(
                  "Member 4",
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 2.0),
                  Row(
                    children: [
                      Text("Name :- ",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            //fontWeight: FontWeight.w600
                          )),
                      // Text(
                      //     "Dhairit Mankad",
                      //     textAlign: TextAlign.start,
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 22.0,
                      //       //fontWeight: FontWeight.w600
                      //     )
                      // ),
                      FutureBuilder(
                        future: _fetchgid(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState != ConnectionState.done)
                            return Text("Loading");
                          return Text("$mymembername",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 22.0));
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 6.0),
                  Row(
                    children: [
                      Text("ID :- ",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            //fontWeight: FontWeight.w600
                          )),
                      // Text(
                      //     "170303108036",
                      //     textAlign: TextAlign.start,
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 22.0,
                      //       //fontWeight: FontWeight.w600
                      //     )
                      // ),
                      FutureBuilder(
                        future: _fetchgid(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState != ConnectionState.done)
                            return Text("Loading");
                          return Text("$mymemberen",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 22.0));
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 6.0),
                  Row(
                    children: [
                      Text("Department :- ",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            //fontWeight: FontWeight.w600
                          )),
                      // Text(
                      //     "IT ",
                      //     textAlign: TextAlign.start,
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 22.0,
                      //       //fontWeight: FontWeight.w600
                      //     )
                      // ),
                      FutureBuilder(
                        future: _fetchgid(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState != ConnectionState.done)
                            return Text("Loading");
                          return Text("$mymemberdept",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 22.0));
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 6.0),
                  Row(
                    children: [
                      Text("Degree:- ",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            //fontWeight: FontWeight.w600
                          )),
                      FutureBuilder(
                        future: _fetchgid(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState != ConnectionState.done)
                            return Text("Loading");
                          return Text("$mymemberdegree",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 22.0));
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _fetchgid() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser();
    if (firebaseUser != null)
      await Firestore.instance
          .collection('users')
          .document(firebaseUser.uid)
          .get()
          .then((ds) {
        mygid = ds.data['gid'].toString();
        _fetchmemberenrollment(mygid);
      }).catchError((e) {
        print(e);
      });
  }

  _fetchmemberenrollment(mygid) async {
    await Firestore.instance
        .collection('gid')
        .document("$mygid")
        .get()
        .then((ds) {
      mymemberenrollment = ds.data['Member4'].toString();
      return _fetchmember(mymemberenrollment);
    }).catchError((e) {
      print(e);
    });
  }

  _fetchmember(mymemberenrollment) async {
    await Firestore.instance
        .collection('users')
        .getDocuments()
        .then((snapshot) {
      snapshot.documents.forEach((doc) {
        if (doc.data['Enrollment'].toString() ==
            mymemberenrollment.toString()) {
          mymembername = doc.data['Name'].toString();
          mymemberen = doc.data['Enrollment'].toString();
          mymemberdept = doc.data['Department'].toString();
          mymemberdegree = doc.data['Degree'].toString();
          return [mymembername, mymemberen, mymemberdept, mymemberdegree];
        }
      });
    });
  }
}
