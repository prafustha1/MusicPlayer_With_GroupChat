import 'package:flutter/material.dart';

class TrendingMusic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "Trending Music",
              style: TextStyle(
                color: Color(0xFF292B37),
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "View More",
              style: TextStyle(
                color: Color(0xFF292B37),
                fontSize: 16,
              ),
            ),
          ]),
        ),
        SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (int i = 1; i < 5; i++)
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 180,
                    height: 170,
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        color: Color(0xFF292B37),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF292B37).withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 6,
                          )
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          // child: Image.asset(
                          //    "images/up$i.jpg",
                          //    height: 130,
                          //    width: 180,
                          //     fit: BoxFit.cover,
                          //    ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 10,
                          ),
                          // ignore: prefer_const_literals_to_create_immutables
                          child: Column(children: [
                            const Text(
                              "Loose you to Love Me",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        )
      ],
    );
  }
}
