import 'package:flutter/material.dart';
import '../../constan.dart';

AppBar homeAppBar() {
  return AppBar(
    backgroundColor: appBackgroundColor,
    title: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: "Welcome Bạn hiền ",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1,
                        color: Colors.white54)),
                TextSpan(text: "👋", style: TextStyle(fontSize: 14))
              ])),
              SizedBox(height: 10),
              Text(
                "Let's relax and watch a movie!",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18),
              )
            ],
          ),
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      "https://t3.ftcdn.net/jpg/06/07/84/82/240_F_607848231_w5iFN4tMmtI2woJjMh7Q8mGvgARnzHgQ.jpg",
                    ))),
          )
        ],
      ),
    ),
  );
}