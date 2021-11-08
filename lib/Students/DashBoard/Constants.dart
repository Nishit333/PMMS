import 'package:flutter/material.dart';

// Color Constants
const white = Color(0xffffffff);
const Black = Color(0xff000000);
const DeepBlue = Color(0xff35548e);
const Fontwhite = Color(0xffFF6F6F4);
const BackGround_Colour = Color(0xffeeeeee);

// Common Widgets
const Box = SizedBox(width: 8);
const Box2 = SizedBox(height: 2);
const Box5 = SizedBox(width: 5);
const Box10 = SizedBox(height: 10);
const Box15 = SizedBox(height: 15);
const Box20 = SizedBox(height: 20);
const Box50 = SizedBox(height: 50);

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