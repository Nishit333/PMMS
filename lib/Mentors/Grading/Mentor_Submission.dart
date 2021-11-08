// Importing Libraries And Packages
import 'package:flutter/material.dart';

import '../Home_Screen_Mentor.dart';
import 'Mentor_Grading.dart';


// Main Widget Topics Is Created
class Mentor_Submission_Screen extends StatelessWidget {
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
                          MaterialPageRoute(builder: (context) => Mentor_Grading_Screen()));
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
                  "Submission",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  "Of Teams",
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

                  // Creating Options Widget And Calling Using Child
                  //child: Options(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

