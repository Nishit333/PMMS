// Importing Packages And Libraries
import 'package:pmms/Students/HomePage/Homepage.dart';
import 'package:pmms/controllers/bifer.dart';
import 'Constants.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Main LoginScreen Widget
class LogIn_Screen extends StatefulWidget {
  @override
  _LogIn_ScreenState createState() => _LogIn_ScreenState();
}

class _LogIn_ScreenState extends State<LogIn_Screen> {

  String _email, _password;
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    //
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(

      // Making It Adjustable As Per Screen
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          Container(
            height: h/1.5,
            width: w,

            // Using Rotated Box For Displaying The Flare Animation
            child: RotatedBox(
              quarterTurns: 0,
              child: FlareActor(
                'assets/LogInOut_Images/CurveAnimation.flr',
                animation: 'Flow',
                alignment: Alignment.topCenter,
                fit: BoxFit.fill,
              ),
            ),
          ),

          // Creating Container For Displaying Text On Screen
          Container(
            margin: EdgeInsets.only(top: h / 8, left: w / 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Text On The Screen In Column
                Text(
                  "Welcome ",
                  style: TextStyle(
                      color: Fontwhite,
                      fontSize: 35,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "Students ",
                  style: TextStyle(
                    color: Fontwhite,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          // Container For Entering The Credentials For The Login
          Container(
            margin: EdgeInsets.only(top:h/1.9,left: w/15, right:w/15),
            alignment: Alignment.center,
            child: Form(
              key: _formkey,
              child: Column(
                children: <Widget>[

                  // Form Field For Entering Email
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Email",
                      hintStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Deep_Purple,
                        height: 1,
                      ),

                      // Border For The Container
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),

                      filled: true,
                      fillColor: BackGround_Colour,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical:20.0),
                    ),
                    onChanged: (input) {
                      _email = input;
                    },
                  ),
                  SizedBox(height: h * 0.02),

                  // Form Field For Entering Password
                  TextFormField(

                    // Securing Text
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      hintStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Deep_Purple,
                        height: 1,
                      ),

                      // Border For The Container
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),

                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                    ),
                    onChanged: (input) {
                      _password = input;
                    },
                  ),

                  // Text For The Raised Button Created For The Submission
                  Container(
                    margin: EdgeInsets.only(top:h/25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          "Sign in",
                          style: TextStyle(
                              color: Deep_Purple,
                              fontSize: 25,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        Box5,

                        // Creating Raised Button For The Submission
                        Container(
                          margin: EdgeInsets.only(top:h * 0.006),
                          height: h / 12,
                          width: h / 12,
                          child: RaisedButton(
                            color: Deep_Purple,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)
                            ),
                            elevation: 3,
                            child: Icon(Icons.arrow_forward,color: Fontwhite,size: 35,),

                            // Navigating To HomePage Screen
                            onPressed: () {
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //       builder: (context) => Home_Page()
                              //   ),
                              // );
                              FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password)
                                  .then((user) => Navigator.push(context, MaterialPageRoute(builder: (context) => bifer())));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}