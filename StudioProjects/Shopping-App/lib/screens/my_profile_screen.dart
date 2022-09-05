import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/features/animated_search_bar.dart';
import 'package:shopping_app/features/profile_image_circle.dart';

import '../app_state_manager.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
        child: Column(
          children: [
            SizedBox(height: 30,),
            Center(
              child: Column(
                children: const [
                  CircleImage(imageProvider: AssetImage('assets/mens spike footbal boots.jpg')),
                  SizedBox(height: 20,),
                  Text('ASOGWA CHI-UBA',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                    fontSize: 30,
                  )),
                ],
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Provider.of<AppStateManager>(context, listen: false)
                    .logout();
              },
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  border: Border.all(
                      width: 5,
                      color: Colors.brown
                  ),),
                child: Row(
                  children: const [
                    SizedBox(width: 20,),
                    Text('Log out',
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),),
                  ],
                ),
              ),
            )
          ],
        ) );
  }
}

