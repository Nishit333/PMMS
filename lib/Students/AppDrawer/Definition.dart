// Importing Libraries And Packages
import 'package:flutter/material.dart';
import 'package:pmms/Students/HomePage/Homepage.dart';
import 'package:pmms/controllers/crud.dart';
import 'Constants.dart';

// Main Widget Topics Is Created
class Definition_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
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

  String _gid,_ProblemDefination,_usersofdef,_problemdetails,_outcome,_projecttype;
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
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
                      color: DeepBlue,
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home_Page()));
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
                  "Team Project",
                  style: TextStyle(
                    color: DeepBlue,
                    fontSize: 40,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  "Definition",
                  style: TextStyle(
                    color: DeepBlue,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),

          // Creating Container To Display The Option Between Sem 7 and 8
          SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Group Id",
                        labelStyle: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: DeepBlue,
                        ),
                        hintText: "Team Number",
                        hintStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: DeepBlue,
                          height: 1,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(
                            width: 5,
                            style: BorderStyle.none,
                          ),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20.0),
                      ),
                      onChanged: (input) {
                        _gid = input;
                      },
                    ),
                    SizedBox(height: h * 0.02),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Problem Statement",
                        labelStyle: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: DeepBlue,
                        ),
                        hintText: "Problem Definition",
                        hintStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: DeepBlue,
                          height: 1,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(
                            width: 5,
                            style: BorderStyle.none,
                          ),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20.0),
                      ),
                      onChanged: (input) {
                        _ProblemDefination = input;
                      },
                    ),
                    SizedBox(height: h * 0.02),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Users",
                        labelStyle: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: DeepBlue,
                        ),
                        hintText: "Beneficiaries From Solution",
                        hintStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: DeepBlue,
                          height: 1,
                        ),

                        // Border For The Container
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(
                            width: 5,
                            style: BorderStyle.none,
                          ),
                        ),

                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20.0),
                      ),
                      onChanged: (input) {
                        _usersofdef = input;
                      },
                    ),
                    SizedBox(height: h * 0.02),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Details",
                        labelStyle: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: DeepBlue,
                        ),
                        hintText: "Description with Context",
                        hintStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: DeepBlue,
                          height: 1,
                        ),

                        // Border For The Container
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(
                            width: 5,
                            style: BorderStyle.none,
                          ),
                        ),

                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20.0),
                      ),
                      onChanged: (input) {
                        _problemdetails = input;
                      },
                    ),
                    SizedBox(height: h * 0.02),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Expected Outcomes",
                        labelStyle: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: DeepBlue,
                        ),
                        hintText: "End Result / Solution ",
                        hintStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: DeepBlue,
                          height: 1,
                        ),

                        // Border For The Container
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(
                            width: 5,
                            style: BorderStyle.none,
                          ),
                        ),

                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20.0),
                      ),
                      onChanged: (input) {
                        _outcome = input;
                      },
                    ),
                    SizedBox(height: h * 0.02),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Project Type",
                        labelStyle: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: DeepBlue,
                        ),
                        hintText: "IDP or UDP",
                        hintStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: DeepBlue,
                          height: 1,
                        ),

                        // Border For The Container
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(
                            width: 5,
                            style: BorderStyle.none,
                          ),
                        ),

                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20.0),
                      ),
                      onChanged: (input) {
                        _projecttype = input;
                      },
                    ),
                    SizedBox(height: 40.0),
                    SizedBox(
                      width: w * 0.6,
                      height: h * 0.07,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: DeepBlue,
                        elevation: 3,
                        onPressed: () async {
                          userSetup(_gid,_ProblemDefination,_usersofdef,_problemdetails,_outcome,_projecttype);
                          return showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              backgroundColor: Colors.grey[200],
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              title: Text(
                                "Thank You",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              content: Text(
                                "Your Weekly Progress Has Been Submitted",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: () {
                                    Navigator.of(ctx).pop();
                                  },
                                  child: Text(
                                    "Okay",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Text(
                          "Submit",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
