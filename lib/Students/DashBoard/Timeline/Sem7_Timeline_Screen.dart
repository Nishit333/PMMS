// Importing Packages And Libraries
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../Constants.dart';
import 'Timeline_Main.dart';

// Declaring Constants
const DeepBlue = Color(0xff35548e);

// Main Widget Sem7 Students.Timeline
class Sem7_TimeLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DeepBlue,
      body: Body(),
    );
  }
}
 
// Body Widget of Main Widget
class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
                IconButton(icon: Icon(
                  Icons.arrow_back,
                  size: 35,
                  color: Colors.white,
                ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => TimeLine_Screen()));
                    }
                ),
              ],
            ),
          ),

          // Displaying Text On The Page in Column
          Container(
            margin: EdgeInsets.only(left: 10.0),
            child: Column(
              children: [
                Text(
                  "Semester 7",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  'TimeLine',
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

          // Creating Container To Display The Timeline
          Container(
            height: height * 0.7549,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(35.0), topRight: Radius.circular(35.0)),
              color: Colors.grey[200],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: height * 0.0001),
                Container(
                  height: height * 0.75,
                  width: width * 0.8,

                  // Creating Timeline Widget And Calling Using Child
                  child: Sem7_Timeline(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Students.Timeline Widget for Sem 7
class Sem7_Timeline extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    //
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.75,
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 40.0),

          // Using TimelineTile Of Flutter For Indicator
          TimelineTile(
            alignment: TimelineAlign.center,
            isFirst: true,
            indicatorStyle:IndicatorStyle(
              width: 20.0,
              color: Color(0xff003D73),

              // Distance Between Two Indicator
              indicatorY: 0.1,
              padding: EdgeInsets.all(8),
            ),

            // First Child ( Indicator )
            leftChild: GestureDetector(
              child: Container(
                child: Column(
                  children: [
                    Image.asset("assets/TimeLine_Images/Definition.png",
                        height: 50.0,
                        width: 50.0
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      "Definition\nSubmission",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black
                      ),
                    ),
                  ],
                ),
              ),

              // Creating Pop-Up Notification For Detail
              onTap: () {
                return showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    backgroundColor: BackGround_Colour,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                    title: Text("Definition Submission", textAlign: TextAlign.center),
                    content: Text("Details for the Procedure"),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: Text("Okay"),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Using TimelineTile Of Flutter For Indicator
          TimelineTile(
            alignment: TimelineAlign.center,
            indicatorStyle: const IndicatorStyle(
              width: 20,
              color: Color(0xff0878A4),
              padding: EdgeInsets.all(8),

              // Distance Between Two Indicator
              indicatorY: 0.3,
            ),

            // Second Child ( Indicator )
            rightChild: GestureDetector(
              child: Container(
                child: Column(
                  children: [
                    Image.asset("assets/TimeLine_Images/Intro_presentation.png", height: 50, width: 50,),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Introductory\nPresentation",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black
                      ),
                    ),
                  ],
                ),
              ),

              // Creating Pop-Up Notification For Detail
              onTap: () {
                return showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    backgroundColor: BackGround_Colour,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                    title: Text("Introductory Presentation", textAlign: TextAlign.center),
                    content: Text("Details for the Procedure"),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: Text("Okay"),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Using TimelineTile Of Flutter For Indicator
          TimelineTile(
            alignment: TimelineAlign.center,
            indicatorStyle: const IndicatorStyle(
              width: 20,
              color: Color(0xff1ecfd6),
              padding: EdgeInsets.all(8),

              // Distance Between Two Indicator
              indicatorY: 0.5,
            ),

            // Third Child ( Indicator )
            leftChild: GestureDetector(
              child: Container(
                child: Column(
                  children: [
                    Image.asset("assets/TimeLine_Images/Meetings.png", height: 50, width: 50,),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Weekly\nMeetings",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black
                      ),
                    ),
                  ],
                ),
              ),

              // Creating Pop-Up Notification For Detail
              onTap: () {
                return showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    backgroundColor: BackGround_Colour,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                    title: Text("Weekly Meetings", textAlign: TextAlign.center),
                    content: Text("Details for the Procedure"),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: Text("Okay"),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Using TimelineTile Of Flutter For Indicator
          TimelineTile(
            alignment: TimelineAlign.center,
            indicatorStyle: const IndicatorStyle(
              width: 20,
              color: Color(0xffedd170),
              padding: EdgeInsets.all(8),

              // Distance Between Two Indicator
              indicatorY: 0.7,
            ),

            // Fourth Child ( Indicator )
            rightChild: GestureDetector(
              child: Container(
                child: Column(
                  children: [
                    Image.asset("assets/TimeLine_Images/Report.png", height: 50, width: 50,),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Report\nSubmission",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black
                      ),
                    ),
                  ],
                ),
              ),

              // Creating Pop-Up Notification For Detail
              onTap: () {
                return showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    backgroundColor: BackGround_Colour,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                    title: Text("Report Submission", textAlign: TextAlign.center),
                    content: Text("Details for the Procedure"),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: Text("Okay"),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Using TimelineTile Of Flutter For Indicator
          TimelineTile(
            alignment: TimelineAlign.center,
            isLast: true,
            indicatorStyle: const IndicatorStyle(
              width: 20,
              color: Color(0xffc05640),
              padding: EdgeInsets.all(8),

              // Distance Between Two Indicator
              indicatorY: 0.9,
            ),

            // Fifth Child ( Indicator )
            leftChild: GestureDetector(
              child: Container(
                child: Column(
                  children: [
                    Image.asset("assets/TimeLine_Images/Final_sub.png", height: 50, width: 50,),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Final\nPresentation",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black
                      ),
                    ),
                  ],
                ),
              ),

              // Creating Pop-Up Notification For Detail
              onTap: () {
                return showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    backgroundColor: BackGround_Colour,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                    title: Text("Final Presentation", textAlign: TextAlign.center),
                    content: Text("Details for the Procedure"),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: Text("Okay"),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
