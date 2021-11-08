// Importing Packages And Libraries
import 'package:flutter/material.dart';
import 'LogIn_Screen.dart';

// Main LogoutScreen Widget
class LogOut_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      alignment: Alignment.center,
      color: Colors.deepOrange,

      // Calling Body Widget Using Child
      child: Body()
    );
  }
}

// Creating Body Widget For The Content Of The Page
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Are You Sure/n You Wanna Go!',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.black
            ),
          ),
          SizedBox(height: 15),
          RaisedButton(
              child: Text(
                  'Login Again'
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LogIn_Screen()));
                }
              ),
        ],
      ),
    );
  }
}
