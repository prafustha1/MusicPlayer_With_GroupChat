import 'package:flutter/material.dart';

class Play extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "Playlist",
              style: TextStyle(
                color: Color(0xFF292B37),
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
          ]),
        ),
        SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
        )
      ],
    );
  }
}
