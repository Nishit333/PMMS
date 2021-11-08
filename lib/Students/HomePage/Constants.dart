import 'package:flutter/material.dart';

// Color Constants
const White = Color(0xffffffff);
const Black = Color(0xff000000);
const DeepBlue = Color(0xff35548e);
const Fontwhite = Color(0xffFF6F6F4);
Color BackGround_Colour = Colors.grey[200];
Color Grey = Colors.grey;

// DashBoard Images Constants
const Back_Image = "assets/DashBoard_Images/Back.png";
const Menu_Image = "assets/DashBoard_Images/Menu.png";
const User_Image = "assets/DashBoard_Images/User.png";
const TeamProfile_Image = "assets/DashBoard_Images/TeamProfile.png";
const Timeline_Image = "assets/DashBoard_Images/Timeline.png";
const Presentation_Image = "assets/DashBoard_Images/Presentation.png";
const Report_Image = "assets/DashBoard_Images/Report.png";
const Topics_Image = "assets/DashBoard_Images/Topics.png";
const Instructions_Image = "assets/DashBoard_Images/Instruction.png";

// App Drawer Images Constants
const Plagiarism_Image = "assets/AppDrawer_Images/Plagiarism.png";
const Definition_Image = "assets/AppDrawer_Images/Definition.png";
const Collaboration_Image = "assets/AppDrawer_Images/Collaboration.png";
const Mentor_Image = "assets/AppDrawer_Images/Mentor.png";
const Certificate_Image = "assets/AppDrawer_Images/Certificate.png";
const Report1_Image = "assets/AppDrawer_Images/Report_Paper.png";
const Settings_Image = "assets/AppDrawer_Images/Settings.png";
const Logout_Image = "assets/AppDrawer_Images/Logout.png";

// Declaring Widgets ( App_Drawer )

const Drawer_TextStyle = TextStyle( color: Black,
    fontWeight: FontWeight.bold,
    fontSize: 23 );

// Declaring Widgets ( Dash_Board )
const Tile_Margin = EdgeInsets.only(bottom:10 ,top:10 );

const Heading_TextStyle = TextStyle( color: Fontwhite,
    fontWeight: FontWeight.bold,
    fontSize: 20
);
const Base_TextStyle = TextStyle( color: Fontwhite,
    fontWeight: FontWeight.bold,
    fontSize: 14
);

BoxDecoration Tile_Decoration = BoxDecoration(
border: Border.all(width:1, color: DeepBlue),
color: DeepBlue,
borderRadius: BorderRadius.circular(30),
);

// Common Widgets
const Box = SizedBox(width: 8);
const Box2 = SizedBox(height: 2);
const Box5 = SizedBox(width: 5);
const Box10 = SizedBox(height: 10);
const Box15 = SizedBox(height: 15);
const Box20 = SizedBox(height: 20);
const Box50 = SizedBox(height: 50);


