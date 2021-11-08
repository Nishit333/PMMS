// Importing Libraries And Packages
import 'package:flutter/material.dart';
import 'Sem7Certificate.dart';
import 'Sem8Certificate.dart';
import '../Constants.dart';
import 'package:pmms/Students/HomePage/Homepage.dart';

// Main Widget Certificate Is Created
class Certificate_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DeepBlue,
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
                          MaterialPageRoute(builder: (context) => Home_Page()));
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
                  "Certificate Of",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  "Completion",
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

                  //Creating Options Widget And Calling Using Child
                  child: Options(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Creating Options Widget For The Content Of Buttons
class Options extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 30.0,
          ),

          // Note ( Warning ) Text Displaying First
          Text(
            "NOTE :-",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            "After Successful Completion of The Project Submission as Per "
                "The Guidelines Generated Certificate will be Presented Here ",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 25.0),

          // First Button As Option Of Sem 7 Timeline
          GestureDetector(
            child: Container(
              height: height * 0.07,
              width: width * 0.8,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [ BoxShadow(
                  color: Colors.black54,
                  blurRadius: 10.0,
                  spreadRadius: 5.0,
                  offset: Offset(8.0,8.0),
                ),],
              ),

              // Decorating The Button
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 55.0),
                  Image.asset("assets/TimeLine_Images/Semester.png",height: 30.0, width: 30.0),
                  SizedBox(width: 10.0),
                  Text(
                    "Semester 7",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            // Creating Navigator To Redirect To Sem 7 Timeline Page
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Sem7_Certificate() ));
            },
          ),
          SizedBox(height: 30.0),

          // Second Button As Option Of Sem 8 Timeline
          GestureDetector(
            child: Container(
              height: height * 0.07,
              width: width * 0.8,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [ BoxShadow(
                  color: Colors.black54,
                  blurRadius: 10.0,
                  spreadRadius: 5.0,
                  offset: Offset(8.0,8.0),
                ),],
              ),

              // Decorating The Button
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 55.0),
                  Image.asset("assets/TimeLine_Images/Semester.png",height: 30.0, width: 30.0),
                  SizedBox(width: 10.0),
                  Text(
                    "Semester 8",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            // Creating Navigator To Redirect To Sem 8 Timeline Page
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Sem8_Certificate()));
            },
          ),
        ],
      ),
    );
  }
}

