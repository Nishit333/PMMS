// Importing all the important files
import 'Mentor_Certificate.dart';
import 'Mentor_Instruction.dart';
import 'Mentor_Profile.dart';
import 'Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Mentor_Report.dart';
import 'Mentor_Setting.dart';
import 'Mentor_Teams.dart';
import 'Grading/Mentor_Grading.dart';
import 'Mentor_Topics.dart';

//HomePage Widget For Overlaying Two Screens
class Home_Page_Mentor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Home_Screen()
    );
  }
}

// Main Code For The Home Screen
class Home_Screen extends StatefulWidget {
  @override
  _Home_ScreenState createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {

  @override
  Widget build(BuildContext context) {

    //
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    // Animated Container For the Sliding Animation Of The Home Screen
    return Container(
      decoration: BoxDecoration(
          color: Fontwhite,
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
                IconButton(icon: Image.asset('assets/Mentors_Images/User.png', width: 33),
                    iconSize: 35,
                    onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Mentor_Profile()));
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
                  icon: Image.asset('assets/Mentors_Images/settings.png', width: 33),
                  iconSize: 35,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Mentor_Settings_Screen()));
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
                      MaterialPageRoute(builder: (context) => Mentor_Teams_Screen()));
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
                      MaterialPageRoute(builder: (context) => Mentor_Report_Screen()));
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
                      Text("Report", style: Heading_TextStyle ),
                      Box2,
                      Text("Final Report Submission", style: Base_TextStyle ),
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
                      MaterialPageRoute(builder: (context) => Mentor_Grading_Screen()));
                },
                child: new Container(
                  height: height * 0.2,
                  width: width * 0.4,
                  margin: Tile_Margin,
                  decoration: Tile_Decoration,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(Grading_Image, width: 45),
                      Box10,
                      Text("Grading", style: Heading_TextStyle ),
                      Box2,
                      Text("Weekly Feedback", style: Base_TextStyle ),
                      Box,
                    ],
                  ),
                ),
              ),

              //Fourth Card
              new GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Mentor_Certificate_Screen()));
                },
                child: new Container(
                  height: height * 0.2,
                  width: width * 0.4,
                  margin: Tile_Margin,
                  decoration: Tile_Decoration,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(Certificate_Image, width: 45),
                      Box10,
                      Text("Certificate", style: Heading_TextStyle ),
                      Box2,
                      Text("Generate Certificate", style: Base_TextStyle ),
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
                      MaterialPageRoute(builder: (context) => Mentor_Topics_Screen()));
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
                      MaterialPageRoute(builder: (context) => Mentor_Instruction_Screen()));
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

