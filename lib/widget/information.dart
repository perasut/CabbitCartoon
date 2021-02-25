import 'dart:ui';

import 'package:cabbitCatoon/utillity/my_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Information extends StatefulWidget {
  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  String displayName;
  @override
  void initState() {
    super.initState();
    findDisplayName();
  }

  Future<Null> findDisplayName() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance.authStateChanges().listen((event) {
        setState(() {
          displayName = event.displayName;
        });
        print('###= $displayName');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        width: 300,
        child: ListTile(
          trailing: IconButton(
              icon: Icon(
                Icons.edit_outlined,
                size: 36,
                color: MyStyle().primaryColor,
              ),
              onPressed: () {
                print('clickkkk');
                editThread();
              }),
          leading: Icon(
            Icons.account_box_outlined,
            size: 48,
            color: MyStyle().darkColor,
          ),
          title: MyStyle().titleH2(displayName == null ? 'Non ?' : displayName),
          subtitle: MyStyle().titleH3('Display name user'),
        ),
      ),
    ));
  }

  Future<Null> editThread() async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: ListTile(
          leading: MyStyle().showLogo(),
          title: Text('Edit Display Name'),
          subtitle: Text('Please Fill New Display in Blank'),
        ),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: MyStyle().boxDecoration(),
                width: 200,
                child: TextFormField(
                  onChanged: (value) => displayName = value.trim(),
                  initialValue: displayName,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_box_outlined),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () async {
                  print('=$displayName');
                  await Firebase.initializeApp().then((value) async {
                    await FirebaseAuth.instance
                        .authStateChanges()
                        .listen((event) async {
                      event
                          .updateProfile(displayName: displayName)
                          .then((value) {
                        findDisplayName();
                        Navigator.pop(context);
                      });
                    });
                  });
                },
                child: Text('edit display'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'cancel',
                  style: TextStyle(color: Colors.red.shade700),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
