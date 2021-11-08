import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> userSetup(String _gid,_ProblemDefination,_usersofdef,_problemdetails,_outcome,_projecttype) async {
  final CollectionReference user = Firestore.instance.collection('gid');
  // FirebaseAuth auth = FirebaseAuth.instance;
  return await user.document(_gid).setData({
    "Group Id": int.parse(_gid),
    "Project Defination" : _ProblemDefination,
    "Users of Project" : _usersofdef,
    "Project Details" : _problemdetails,
    "Outcome" : _outcome,
    "Project Type" : _projecttype
  });
}