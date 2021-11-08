// Importing Libraries And Packages
import 'package:flutter/material.dart';
import 'package:pmms/Students/HomePage/Homepage.dart';
import 'Constants.dart';

// Main Widget Topics Is Created
class Presentation_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
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
                IconButton(icon: Icon(
                  Icons.arrow_back,
                  size: 35,
                  color: DeepBlue,
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
                  "Weekly",
                  style: TextStyle(
                    color: DeepBlue,
                    fontSize: 40,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  "Submission",
                  style: TextStyle(
                    color: DeepBlue,
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
          SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only( top: 20.0, left: 25.0, right: 25.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Group ID",
                        labelStyle: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: DeepBlue,
                        ),
                        hintText: "Enter Group ID",
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
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical:20.0),
                      ),
                    ),

                    SizedBox(height: h * 0.02),

                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Progress Week",
                        labelStyle: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: DeepBlue,
                        ),
                        hintText: "Enter Week",
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
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                      ),
                    ),

                    SizedBox(height: h * 0.02),

                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Meeting Link",
                        labelStyle: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: DeepBlue,
                        ),
                        hintText: "Enter Link",
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
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                      ),
                    ),

                    SizedBox(height: h * 0.02),

                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Progress Title",
                        labelStyle: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: DeepBlue,
                        ),
                        hintText: "Enter Title",
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
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                      ),
                    ),

                    SizedBox(height: h * 0.02),

                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Description",
                        labelStyle: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: DeepBlue,
                        ),
                        hintText: "Progress Details",
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
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                      ),
                    ),

                    SizedBox(height: 40.0),

                    SizedBox(
                      width: w * 0.7,
                      height: h * 0.07,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                        ),
                        color: DeepBlue,
                        elevation: 3,
                        onPressed: () {
                          return showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              backgroundColor: Colors.grey[200],
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                              title: Text("Thank You", textAlign: TextAlign.center, style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),),
                              content: Text("Your Weekly Progress Has Been Submitted",textAlign: TextAlign.center,style: TextStyle(
                                fontSize: 20.0,
                              ),),
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: () {
                                    Navigator.of(ctx).pop();
                                  },
                                  child: Text("Okay", textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),),
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
        ],
      ),
    );
  }
}


class _Radiobutton extends StatefulWidget {
  @override
  _RadioButtonWidget createState() => _RadioButtonWidget();
}

class _RadioButtonWidget extends State {

  String radioItem = '';

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        RadioListTile(
          groupValue: radioItem,
          title: Text('Radio Button Item 1'),
          value: 'Item 1',
          onChanged: (val) {
            setState(() {
              radioItem = val;
            });
          },
        ),

        RadioListTile(
          groupValue: radioItem,
          title: Text('Radio Button Item 2'),
          value: 'Item 2',
          onChanged: (val) {
            setState(() {
              radioItem = val;
            });
          },
        ),

        Text('$radioItem', style: TextStyle(fontSize: 23),)

      ],
    );
  }
}
