// Importing Libraries And Packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pmms/Students/HomePage/Homepage.dart';
import 'Constants.dart';

// Main Widget Topics Is Created
class Mentors_Screen extends StatelessWidget {
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

  String mymentors;

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
                  "Mentors",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  "List",
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
                  child: FutureBuilder(
                    // FutureBuilder<QuerySnapshot>(
                    future: _fetchmentor(),
                    // future: Firestore.instance.collection('users').getDocuments(),
                    builder: (context, snapshot) {
                      if(snapshot.connectionState != ConnectionState.done)
                        return Text("Loading");
                      int n = (("$mymentors".length)/2).floor();
                      return Text("$mymentors".substring(0,n),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22.0
                          ));
                      // if (snapshot.hasData) {
                      //   final List<DocumentSnapshot> documents = snapshot.data.documents;
                      //   return Text(documents.map((e) => (e['role'] == "faculty") ? "Prof. " +  e['Name'] + " from " + e['Department'] : null).join('\n'));
                      //   // return ListView(
                      //   //     children: documents.map((doc) => Card(
                      //   //               child: ListTile(
                      //   //                 title: Text(doc['Name'].toString()),
                      //   //                 subtitle: Text(doc['role'].toString()),
                      //   //               ),
                      //   //             ))
                      //   //         .toList()
                      //   // );
                      // }
                      // else if(snapshot.hasError) {
                      //   return Text("Error");
                      // }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _fetchmentor() async {
    mymentors = "";
    int n = 1;
    await Firestore.instance.collection('users')
        .getDocuments()
        .then((snapshot) {
      snapshot.documents.forEach((doc){
        if(doc.data['role'] == "faculty") {
          mymentors = mymentors + n.toString() + ". Prof. " + doc.data['Name'] + " from " + doc.data['Department'] + "\n";
          n = n + 1;
        }
      });
      return mymentors;
    });
  }
}

