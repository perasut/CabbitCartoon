import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ShowCartoonList extends StatefulWidget {
  ShowCartoonList({Key key}) : super(key: key);

  @override
  _ShowCartoonListState createState() => _ShowCartoonListState();
}

class _ShowCartoonListState extends State<ShowCartoonList> {
  @override
  void initState() {
    super.initState();
    readData();
  }

  Future<Null> readData() async {
    await Firebase.initializeApp().then((value) async {
      print('initialize success');
      await FirebaseFirestore.instance
          .collection('cartoon')
          .snapshots()
          .listen((event) {
        print('snapShot = ${event.docs}');
        for (var snapShot in event.docs) {
          Map<String, dynamic> map = snapShot.data();
          print('map = $map');
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Title'),
      // ),
      body: Container(
        child: Text('data'),
      ),
    );
  }
}
