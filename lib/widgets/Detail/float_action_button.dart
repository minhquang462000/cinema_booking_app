import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constan.dart';
import '../../screens/reservation_screen.dart';

class FloatActionButton extends StatelessWidget {
  final VoidCallback changePage;

  const FloatActionButton({super.key, required this.changePage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: Color(0xff1c1c27),
            blurRadius: 60,
            spreadRadius: 80,
          ),
        ],
      ),
      child: FloatingActionButton.extended(
        backgroundColor: Colors.transparent,
        onPressed: () {},
        label: MaterialButton(
          onPressed: changePage,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          color: buttonColor,
          height: 70,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 60),
            child: Center(
              child: Text(
                "Get Reservation",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
