// Importing Packages And Libraries
import 'Constants.dart';
import 'package:flutter/material.dart';
import 'package:pmms/LogIn_Out/LogIn_Screen.dart';


// OnBoarding Widget
class OnBoarding_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // Using Body Widget For The Body Content Of The Screen
      body: Body(),
    );
  }
}

// Body Widget For Content Of Splash Screen
class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  // Variable For Storing Current Slide Index
  var currentPage = 0;

  // List Of The Headings On All Slides
  List<Map<String, String>> splashData = [
    {
      "image": "assets/OnBoarding_Images/OnboardingPicture1.png",
      "Heading": "Availibilty",
      "Description": "Submit your Work\nAnytime, Anywhere."
    },
    {
      "image": "assets/OnBoarding_Images/OnboardingPicture2.png",
      "Heading": "Collaboration",
      "Description": "Learn To Work\n With your Team"
    },
    {
      "image": "assets/OnBoarding_Images/OnboardingPicture3.png",
      "Heading": "Efficiency",
      "Description": "We got you Everything\n Under the System "
    },
  ];
  @override
  Widget build(BuildContext context) {

    //
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 4,

              // Page View Builder For Keeping Record Of Current Slide
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,

                // Display Headings For Every Slide
                itemBuilder: (context, index) => SplashContent(
                    image: splashData[index]["image"],
                    Heading: splashData[index]['Heading'],
                    Description: splashData[index]['Description']
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 0.0
                ),
                child: Column(
                  children: [
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length, (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 2),

                    // Button Skipping The OnBoarding Screen
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
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => LogIn_Screen()));
                        },
                        child: Text(
                          "Skip",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Fontwhite,
                          ),
                        ),
                      ),
                    ),
                    Spacer(flex: 3),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Animated Container For Slide Indicator
  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      // Space Between The Dots
      margin: EdgeInsets.only(right: 5),
      height: 6,
      // Change Of Width On Indexing 
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? Color(0xffee8843) : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}

// Alignment Of Content In Display Screen
class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    this.Heading,
    this.Description,
    this.image,
  }) : super(key: key);
  final String Heading, Description, image;

  @override
  Widget build(BuildContext context) {

    //
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        Spacer(),

        // Displaying Image
        Image.asset(
          image,
          height: h * 0.5,
          width: w * 0.7,
        ),
        Box5,

        // Text For Heading Part
        Text(
          Heading,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30.0,
            color: DeepBlue,
            fontWeight: FontWeight.bold,
          ),
        ),
        Box5,

        // Text For The Description Part
        Text(
          Description,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25.0,
            color: DeepBlue,
          ),
        ),
      ],
    );
  }
}