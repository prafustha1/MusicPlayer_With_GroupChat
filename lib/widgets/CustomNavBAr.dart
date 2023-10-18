import 'package:flutter/material.dart';
import 'package:musicsync/Authenticate/LoginScree.dart';

import 'package:musicsync/sync.dart';

class CustomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Color(0xFF292B37),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          )),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, "/");
          },
          child: Icon(
            Icons.home,
            size: 35,
            color: Colors.white,
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, "playlist");
          },
          child: Icon(
            Icons.local_atm_rounded,
            size: 35,
            color: Colors.white,
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
          },
          child: Icon(
            Icons.person,
            size: 35,
            color: Colors.white,
          ),
        ),
      ]),
    );
  }
}
