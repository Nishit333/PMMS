// Importing Libraries And Packages
import 'package:flutter/material.dart';
import 'package:pmms/Students/HomePage/Constants.dart';
import 'package:pmms/Students/HomePage/Homepage.dart';

// Main Widget Settings Is Created
class Settings_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: White,
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    color: Black,
                    ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home_Page()));
                      }
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
