import 'package:flutter/material.dart';

// Color Constants
const White = Color(0xffffffff);
const Black = Color(0xff000000);
const DeepBlue =  Color(0xff35548e);
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
const Grading_Image = "assets/Mentors_Images/Grading.png";

// App Drawer Images Constants
const Plagiarism_Image = "assets/AppDrawer_Images/Plagiarism.png";
const Definition_Image = "assets/AppDrawer_Images/Definition.png";
const Collaboration_Image = "assets/AppDrawer_Images/Collaboration.png";
const Mentor_Image = "assets/AppDrawer_Images/Mentor.png";
const Certificate_Image = "assets/AppDrawer_Images/Certificate.png";
const Report1_Image = "assets/AppDrawer_Images/Report_Paper.png";
const Settings_Image = "assets/AppDrawer_Images/Settings.png";
const Logout_Image = "assets/AppDrawer_Images/Logout.png";

// Common Widgets
const Box = SizedBox(width: 8);
const Box2 = SizedBox(height: 2);
const Box5 = SizedBox(width: 5);
const Box10 = SizedBox(height: 10);
const Box15 = SizedBox(height: 15);
const Box20 = SizedBox(height: 20);
const Box50 = SizedBox(height: 50);

BoxDecoration Tile_Decoration = BoxDecoration(
  border: Border.all(width:1, color: Color(0xff063970)),
  color: Color(0xff063970),
  borderRadius: BorderRadius.circular(30),
);

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

// Declaring Widgets
const Arrow_Back = Icon( Icons.arrow_back,
    size: 35,
    color: Colors.white );

const Report_Paper_Link = "https://firebasestorage.googleapis.com/v0/b/login-demo-4c447.appspot.com/o/832311537850545710616122743882106819344.pdf?alt=media&token=59a0890e-64d4-49a3-b8fd-6dbede9a68f8";

const White_Container = BoxDecoration( borderRadius: BorderRadius.only(topLeft: Radius.circular(35.0), topRight: Radius.circular(35.0)),
    color: Color(0xffEEEEEE) );

const Instruction_Link = "https://drive.google.com/file/d/1MLbVHq_r-B53uaHK5g4LpC3CtmA1-5d2/view?usp=sharing";

// Methods
Instruction_Text () {
  Text(
    "Instruction",
    style: TextStyle(
      color: Fontwhite,
      fontSize: 40,
    ),
  );
  Box5;
  Text(
    "Project Guidelines",
    style: TextStyle(
      color: Fontwhite,
      fontSize: 30,
    ),
  );
}

ReportPaper_Text () {
  Text(
    "Sample",
    style: TextStyle(
      color: Fontwhite,
      fontSize: 40,
    ),
  );
  Box5;
  Text(
    'Final Report',
    style: TextStyle(
      color: Fontwhite,
      fontSize: 30,
    ),
  );
}