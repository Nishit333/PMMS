import 'package:flutter/material.dart';
import 'package:pmms/Students/HomePage/Homepage.dart';
import 'Constants.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class Mentor_Instruction_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DeepBlue,
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
              children: [
                IconButton(icon: Arrow_Back,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home_Page()));
                    }
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0),
            child: Column(
              children: Instruction_Text(),
            ),
          ),
          Box15,
          Container(
            height: height * 0.7549,
            width: width,
            decoration: White_Container,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: height * 0.0001),
                Container(
                  height: height * 0.6,
                  width: width * 0.8,
                  child: ViewPdf(),
                ),
                SizedBox(
                  width: width * 0.5,
                  height: height * 0.07,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                    ),
                    color: DeepBlue,
                    onPressed: () {},
                    child: Text(
                      "Download",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Fontwhite,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class SampleDocument extends StatefulWidget {
  @override
  _ViewPdfState createState() => _ViewPdfState();
}

class ViewPdf extends StatefulWidget {
  @override
  _ViewPdfState createState() => _ViewPdfState();
}

class _ViewPdfState extends State<ViewPdf> {
  PDFDocument _doc;
  bool _loading;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initpdf();
  }

  _initpdf() async{
    setState(() {
      _loading = true;
    });
    String data;
    final doc = await PDFDocument.fromURL( Instruction_Link );
    setState(() {
      _doc = doc;
      _loading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _doc==null?Center(
          child: CircularProgressIndicator())
          :PDFViewer(document: _doc),
    );
  }
}


