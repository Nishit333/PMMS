// Importing Packages And Libraries
import 'package:pmms/Students/HomePage/Homepage.dart';
import '../Constants.dart';
import 'package:flutter/material.dart';

// Creating Main Widget For Plagiarism Screen
class Plagiarism_Checker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DeepBlue,
      body: Body(),
    );
  }
}

// Creating Body Widget For The Content Of The Page
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

              // Creating Arrow Widget
              children: [
                IconButton(icon: Icon(
                  Icons.arrow_back,
                  size: 35,
                  color: Fontwhite,
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
                  "Plagiarism",
                  style: TextStyle(
                    color: Fontwhite,
                    fontSize: 40,
                  ),
                ),
                Box5,
                Text(
                  'Checker',
                  style: TextStyle(
                    color: Fontwhite,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
          Box15,

          // Creating Container To Display The Content
          Container(
            height: height * 0.7549,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(35.0), topRight: Radius.circular(35.0)),
              color: Colors.grey[200],
            ),
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                // Creating Widget For Uploading Document
                Container(
                  height: height * .3,
                  width: width * .85,
                  decoration: BoxDecoration(
                    color: DeepBlue,
                    boxShadow: [new BoxShadow(
                      color: Grey,
                      blurRadius: 20.0,
                    )],
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Box10,
                      Text(
                        'Upload Document',
                        style: TextStyle(
                          fontSize: 23.0,
                          color: Fontwhite,
                        ),
                      ),
                      Box10,

                      Container(
                        height: height * 0.15,
                        width: width * 0.725,
                        decoration: BoxDecoration(
                          color: Fontwhite,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      Box13,

                      // Creating Widget For Buttons For Actions
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          // Creating Flat Button For Selecting Document
                          FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: BackGround_Colour,
                            textColor: Black,
                            onPressed:() {},
                            child: Text(
                              'Select',
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                          SizedBox(width: width * 0.15),

                          // Creating Flat Button For Submitting Document
                          FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: BackGround_Colour,
                            textColor: Black,
                            onPressed:() {
                              showAlertDialog(context);
                            },
                            child: Text(
                            'Upload',
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Creating New Widget For Displaying Results
                Container(
                  height: height * 0.35,
                  width: width * 0.85,
                  decoration: BoxDecoration(
                      color: DeepBlue,
                      boxShadow: [new BoxShadow(
                        color: Grey,
                        blurRadius: 20.0,
                      )],
                      borderRadius: BorderRadius.circular(35.0)
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Box10,
                      Text(
                        'Results',
                        style: TextStyle(
                            fontSize: 23.0,
                            color: Fontwhite
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                      Box10,
                      Container(
                        height: height * 0.25,
                        width: width * 0.725,
                        decoration: BoxDecoration(
                          color: Fontwhite,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
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
}

// Creating Alert Dialog Box For Displaying Message
showAlertDialog(BuildContext context) {

  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;

  AlertDialog alert = AlertDialog(
    content: Container(
      height: height * 0.2,
      width: width * 0.6,
      decoration: BoxDecoration(
        image: new DecorationImage(
          image: AssetImage('assets/icons/Thankyou.gif'),
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    ),
    title: Text('Submission Accepted',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25.0,
        )),
    actions: [
    ],
    elevation: 20.0,
    backgroundColor: BackGround_Colour,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
    ),
  );

  // Return Alert
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
