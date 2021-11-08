// Importing all the important files
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pmms/LogIn_Out/LogOut_Screen.dart';
import 'package:pmms/Students/AppDrawer/Certificate/Certificate.dart';
import 'package:pmms/Students/AppDrawer/Reportpaper_Screen.dart';
import 'package:pmms/Students/AppDrawer/Settings.dart';
import 'package:pmms/Students/MyProfile_Screen.dart';
import 'Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pmms/Plagiarism/Plagiarism_Screen.dart';
import 'package:pmms/Students/AppDrawer/Collaboration.dart';
import 'package:pmms/Students/AppDrawer/Definition.dart';
import 'package:pmms/Students/AppDrawer/Mentors.dart';
import 'package:pmms/Students/DashBoard/Instruction_Screen.dart';
import 'package:pmms/Students/DashBoard/Presentation_Screen.dart';
import 'package:pmms/Students/DashBoard/Report_Screen.dart';
import 'package:pmms/Students/DashBoard/TeamProfile_Screen.dart';
import 'package:pmms/Students/DashBoard/Timeline/Timeline_Main.dart';
import 'package:pmms/Students/DashBoard/Topics_Screen.dart';

//HomePage Widget For Overlaying Two Screens
class Home_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Drawer_Screen(),
          Home_Screen(),
        ],
      ),
    );
  }
}

// Defining DrawerScreen method
class Drawer_Screen extends StatefulWidget {
  @override
  _Drawer_ScreenState createState() => _Drawer_ScreenState();
}

class _Drawer_ScreenState extends State<Drawer_Screen> {

  String myName;

  @override
  Widget build(BuildContext context) {

    //
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: BackGround_Colour,
      ),
      padding: EdgeInsets.only(top:h * 0.05, bottom: h * 0.07, left: w * 0.05, right: w * 0.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Box50,

          // Text Block Displayed At the Top
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello",
                style: TextStyle
                  (
                    color: Black,
                    fontSize: 35
                ),
              ),
              // Text(
              //   "Student Name",
              //   style: TextStyle
              //     (
              //       color: Black,
              //       fontWeight: FontWeight.bold,
              //       fontSize: 25
              //   ),
              // ),
              Row(
                children: [
                  Container(
                      child:FutureBuilder(
                        future: _fetchname(),
                        builder: (context,snapshot) {
                          if(snapshot.connectionState != ConnectionState.done)
                            return Text("Loading");
                          return Text("$myName",
                            style: TextStyle
                              (
                                color: Colors.black,
                                fontSize: 35
                            ),);
                        },
                      )
                  ),

                ],
              ),
            ],
          ),
          Box15,

          // First Option In App Drawer
          new GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Definition_Screen()));
            },
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(Definition_Image, width: 31),
                    Box,
                    Text("Definition",style: Drawer_TextStyle )
                  ],
                ),
              ],
            ),
          ),

          // Second Option In App Drawer
          new GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Collaboration_Screen()));
            },
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(Collaboration_Image, width: 31),
                    Box,
                    Text("Collaboration",style: Drawer_TextStyle )
                  ],
                ),
              ],
            ),
          ),

          // Third Option In App Drawer
          new GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Mentors_Screen()));
            },
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(Mentor_Image, width: 31),
                    Box,
                    Text("Mentors",style: Drawer_TextStyle )
                  ],
                ),
              ],
            ),
          ),

          // Fourth Option In App Drawer
          new GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Certificate_Screen()));
            },
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(Certificate_Image, width: 31),
                    Box,
                    Text("Certificate",style: Drawer_TextStyle )
                  ],
                ),
              ],
            ),
          ),

          // Fifth Option In App Drawer
          new GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Plagiarism_Checker()));
            },
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(Plagiarism_Image, width: 31),
                    Box,
                    Text("Plagiarism",style: Drawer_TextStyle )
                  ],
                ),
              ],
            ),
          ),

          // Sixth Option In App Drawer
          new GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Report_Document()));
            },
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(Report1_Image, width: 31),
                    Box,
                    Text("Report Paper",style: Drawer_TextStyle )
                  ],
                ),
              ],
            ),
          ),

          // Seventh Option In App Drawer
          new GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Settings_Screen()));
            },
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(Settings_Image, width: 31),
                    Box,
                    Text("Settings",style: Drawer_TextStyle )
                  ],
                ),
              ],
            ),
          ),

          // Eight Option In App Drawer
          Box20,
          new GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LogOut_Screen()));
            },
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(Logout_Image, width: 31),
                    Box10,
                    Text("Log Out",style: Drawer_TextStyle )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _fetchname() async {
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

}


// Main Code For The Home Screen
class Home_Screen extends StatefulWidget {
  @override
  _Home_ScreenState createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {

  // Declaring Offsets And Bool Values
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {

    //
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    // Animated Container For the Sliding Animation Of The Home Screen
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)..scale(scaleFactor)..rotateY(isDrawerOpen? -0.5:0)..rotateZ(isDrawerOpen? 50.0:0),
      duration: Duration(milliseconds: 300),

      decoration: BoxDecoration(
          color: Fontwhite,
          borderRadius: BorderRadius.circular(isDrawerOpen?40:0.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 40.0,
            )]
      ),

      // Code For The Bar At The Top
      child: Column(
        children: [
          SizedBox(height: h * 0.06),
          Container(
            padding: EdgeInsets.fromLTRB(w * 0.01, h * 0.05, w * 0.01, h * 0.06),
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isDrawerOpen?IconButton(
                  icon: Image.asset(Back_Image, width: 40),
                  onPressed: () {
                    setState(() {
                      xOffset = 0;
                      yOffset = 0;
                      scaleFactor = 1;
                      isDrawerOpen = false;
                    });
                  },
                ):
                IconButton(icon: Image.asset(Menu_Image, width: 33),
                    iconSize: 35,
                    onPressed: (){
                      setState(() {
                        xOffset = h * 0.25;
                        yOffset = h * 0.125;
                        scaleFactor = 0.9;
                        isDrawerOpen = true;
                      });
                    }),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Dashboard",style: (
                        TextStyle(
                          color: Black,
                          fontSize: 30,
                        )
                    ),),
                  ],
                ),
                IconButton(
                  icon: Image.asset(User_Image, width: 33),
                  iconSize: 35,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyProfile()));
                  },
                ),
              ],
            ),
          ),
          GridDashboard()
        ],
      ),
    );
  }
}

//DashBoard Content Code Of Blocks ( Options )
class GridDashboard extends StatelessWidget {
  @protected
  Widget build(BuildContext context) {

    //
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(left: 28.0, right: 28.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            // First Card
            children: [
              new GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TeamProfile_Screen()));
                },
                child: new Container(
                  height: height * 0.2,
                  width: width * 0.4,
                  margin: Tile_Margin,
                  decoration: Tile_Decoration,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(TeamProfile_Image, width: 45),
                      Box10,
                      Text("Profile", style: Heading_TextStyle ),
                      Box2,
                      Text("Team Profile", style: Base_TextStyle ),
                      Box,
                    ],
                  ),
                ),
              ),

              //Second Card
              new GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TimeLine_Screen()));
                },
                child: new Container(
                  height: height * 0.2,
                  width: width * 0.4,
                  margin: Tile_Margin,
                  decoration: Tile_Decoration,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(Timeline_Image, width: 45),
                      Box10,
                      Text("Timeline", style: Heading_TextStyle ),
                      Box2,
                      Text("Progress Timeline", style: Base_TextStyle ),
                      Box,
                    ],
                  ),
                ),
              ),
            ],
          ),

          //Third Card
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              new GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Presentation_Screen()));
                },
                child: new Container(
                  height: height * 0.2,
                  width: width * 0.4,
                  margin: Tile_Margin,
                  decoration: Tile_Decoration,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(Presentation_Image, width: 45),
                      Box10,
                      Text("Presentation", style: Heading_TextStyle ),
                      Box2,
                      Text("Weekly Submission", style: Base_TextStyle ),
                      Box,
                    ],
                  ),
                ),
              ),

              //Fourth Card
              new GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Report_Screen()));
                },
                child: new Container(
                  height: height * 0.2,
                  width: width * 0.4,
                  margin: Tile_Margin,
                  decoration: Tile_Decoration,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(Report_Image, width: 45),
                      Box10,
                      Text("Report", style: Base_TextStyle ),
                      Box2,
                      Text("Weekly Card", style: Heading_TextStyle ),
                      Box,
                    ],
                  ),
                ),
              ),
            ],
          ),

          //Fifth card
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              new GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Topics_Screen()));
                },
                child: new Container(
                  height: height * 0.2,
                  width: width * 0.4,
                  margin: Tile_Margin,
                  decoration: Tile_Decoration,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(Topics_Image, width: 45),
                      Box10,
                      Text("Topics", style: Heading_TextStyle ),
                      Box2,
                      Text("Project Definitions", style: Base_TextStyle ),
                      Box,
                    ],
                  ),
                ),
              ),

              //Sixth Card
              new GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Instructions_Screen()));
                },
                child: new Container(
                  height: height * 0.2,
                  width: width * 0.4,
                  margin: Tile_Margin,
                  decoration: Tile_Decoration,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(Instructions_Image, width: 45),
                      Box10,
                      Text("Instruction", style: Heading_TextStyle ),
                      Box2,
                      Text("Project Guidelines", style: Base_TextStyle ),
                      Box,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


